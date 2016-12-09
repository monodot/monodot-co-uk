---
layout: post
title:  "Fixing DNS issues when using Vagrant Landrush"
date:   2016-03-25 21:02:23 +0000
categories: openshift vagrant
comments: true
---
The [landrush plugin](https://github.com/vagrant-landrush/landrush) for [Vagrant](https://www.vagrantup.com/) is mega useful. It acts as a mini-DNS server for your host and guest machines, making the process of network config so much easier.

This makes it easy for your boxes to talk to each other using their hostnames, or to set up subdomains.

It’s a huge improvement on the old days of spending hours faffing with network settings in VirtualBox or hacking your `hosts` file.

However, there are a couple of things I sometimes need to add to a Vagrantfile to improve landrush‘s interoperability.

## Fixing failed DNS lookups in the guest OS

Although _landrush_ does a great job of seamlessly handling DNS requests, sometimes a guest machine has difficulty accessing external addresses. For example, I got this error from [Docker](https://www.docker.com/what-docker) running inside my guest:

    Trying to pull repository registry.access.redhat.com/jboss/apiman-wildfly ... not found
    0b8d87d0b8c2: Error pulling image (latest) from docker.io/jboss/apiman-wildfly, Server error: Status 0 while fetching image layer (f1b10cd842498c23d206ee0cbeaa9de8d2ae09ff3c7af2723a9e337a6965d639) 0cbeaa9de8d2ae09ff3c7af2723a9e337a6965d639)
    failed
    Error pulling image (latest) from docker.io/jboss/apiman-wildfly, Server error: Status 0 while fetching image layer (f1b10cd842498c23d206ee0cbeaa9de8d2ae09ff3c7af2723a9e337a6965d639)

_"Server error: Status 0"_ means that Docker encountered some network issue when trying to pull an image from Docker Hub.

A quick attempt at trying to search for an image also resulted in an error:

    $ docker search apiman
    Error response from daemon: invalid registry endpoint https://registry.access.redhat.com/v0/: unable to ping registry endpoint https://registry.access.redhat.com/v0/
    v2 ping attempt failed with error: Get https://registry.access.redhat.com/v2/: dial tcp: lookup registry.access.redhat.com: Temporary failure in name resolution
    v1 ping attempt failed with error: Get https://registry.access.redhat.com/v1/_ping: dial tcp: lookup registry.access.redhat.com: Temporary failure in name resolution. If this private registry supports only HTTP or HTTPS with an unknown CA certificate, please add `--insecure-registry registry.access.redhat.com` to the daemon's arguments. In the case of HTTPS, if you have access to the registry's CA certificate, no need for the flag; simply place the CA certificate at /etc/docker/certs.d/registry.access.redhat.com/ca.crt

The problem is that _landrush_ sometimes doesn’t manage to seamlessly intercept DNS queries from the guest, and route them to the DNS server on your network for lookup. This means that when the guest tries to look up a DNS entry – for example `registry.access.redhat.com` – _landrush_ returns nothing, and so the request fails.

I’ve found that this seems to happen on some networks, but not others.

One solution is to **explicitly give landrush the IP address of the upstream DNS server** using its `upstream` config parameter.

Any DNS queries from the guest machine will then be referred to, and the result obtained from, the upstream DNS server that you specify.

To set the `upstream` config parameter, add the following to your _Vagrantfile_:

{% highlight ruby %}
config.landrush.upstream 'x.x.x.x'
{% endhighlight %}

where `x.x.x.x` is the IP address of your network’s DNS server. You can usually get the IP address of your DNS server from your host OS’s network settings.

Note that you may need to **re-provision** the machine (`vagrant provision`) once you’ve made this change.

The `upstream` parameter is documented in the README for _landrush_.

## Adding a DNS entry for your host machine

Sometimes, I also want a Vagrant guest machine to be able to access services running on my host machine.

For example, if I run a [Nexus repository](http://blog.sonatype.com/2010/04/why-nexus-for-the-non-programmer/#.VvWl3sfvGRs) on my host machine then I might want the guest to be able to retrieve artifacts from it.

I could do this by hardcoding my host machine’s IP address in my list of repositories in Maven. But I think it’s neater instead to refer to my host machine by hostname.

So I create a DNS entry in landrush for my host machine, by adding the following to my _Vagrantfile_:

{% highlight ruby %}
config.landrush.host 'nexus.local', '10.1.2.1'
{% endhighlight %}

Where `10.1.2.1` is your host IP address.

This means that your guest will now be able to access the host machine using the hostname `nexus.local`, e.g. http://nexus.local:8081/nexus/...

## Result

Your resulting landrush configuration block in your Vagrantfile may look something like this:

{% highlight ruby %}
config.landrush.enabled = true
config.landrush.tld = 'guest.vm'
config.landrush.host 'guest.vm', "#{PUBLIC_ADDRESS}"
config.landrush.host 'nexus.local', '10.1.2.1'
config.landrush.upstream 'x.x.x.x'
{% endhighlight %}

Happy DNS-ing 🙂

Just a note of caution: if you’re switching between wifi networks, make sure to update the upstream IP address. You can also stop landrush entirely when you’ve finished working with your virtual machine, using `vagrant landrush stop`.



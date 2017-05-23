---
layout: post
title:  "OpenShift Cheat Sheet"
description: "A page of useful commands and one-liners for OpenShift 3 - including builds, deployments, and troubleshooting."
date:   2016-12-09 17:00:00 +0000
categories: openshift
comments: true
---

This page is where I put the commands and _script-fu_ that I tend to use most often for [OpenShift][os] 3 (Kubernetes/Docker). Originally written to aid my poor memory, but shared here in case you find it useful.

BTW, OpenShift is an awesome platform. If you haven't tried it out yet, you can:

- get [Minishift][minishift], or
- get the [Red Hat Container Development Kit][cdk], or
- on a machine with Docker and the [`oc` client tools][occlient] installed, just type `oc cluster up`

**NB:** This is a living page, regularly updated - so if you have any commands you'd like to suggest, please add them in the comments. Thankyou!

{% include toc.html %}

## Getting started

[Start a simple local all-in-one OpenShift cluster][clusterup] with a configured registry, router, image streams, and default templates:

    oc cluster up

## Working with objects

Copy an object from another project into the current project (e.g. a BuildConfig, DeploymentConfig, etc.):

    oc export bc/your-bc-name -n otherproject -o json | oc create -f -

## Builds

Start a build and follow (tail) the log onscreen:

    oc start-build your-build-name --follow

Add a trigger to a build, on completion of another build (e.g. if the build pushes to the ImageStreamTag `my-build:latest`):

    oc set trigger bc/my-build-after --from-image=my-build:latest

## Images

Create an image stream:

    oc create is your-image-stream-name

Import an image from an external registry:

    oc import-image --from=registry.access.redhat.com/jboss-amq-6/amq62-openshift -n openshift jboss-amq-62:1.3 --confirm

Grant permissions for a build to pull an image from another project:

    oc policy add-role-to-user system:image-puller system:serviceaccount:yourbuildproject:builder -n namespace-to-pull-from

## Secrets

Create a new secret for a build, where the source is located in a Git repository that requires authentication:

    oc secrets new-basicauth gitsecret --username=jsmith --password=secret
    oc secrets link sa/builder secret/gitsecret

## Red Hat JBoss Middleware

JBoss Fuse, AMQ, EAP. _Lush._

Install the JBoss middleware image streams:

    oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/jboss-image-streams.json -n openshift

Install one of the [JBoss middleware templates for OpenShift][jbosstpl] (A-MQ, EAP, etc.)

    oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/amq/amq62-persistent-ssl.json -n openshift

Create a new app using one of the templates, and download dependencies from a local Maven mirror, instead of Maven Central:

    oc new-app jboss-webserver30-tomcat8-openshift~https://github.com/monodot/helloworld-gwt -e MAVEN_MIRROR_URL=http://nexus.yourcompany.com:8081/nexus/content/groups/public/

## Integrated Docker registry

Verify that the registry is up and running in the `default` project:

    oc get all -n default

Redeploy the integrated Docker registry:

    oc deploy docker-registry --retry

## Troubleshooting

### The `oc` command line tool

(Windows) Tell OC to use your local C: drive as the location for its `.kube` config file. Useful in environments where your home drive is set to a network drive, or your `.kube` config file is otherwise inaccessible:

    set KUBECONFIG=C:\Users\username\.kube\config

Or use these:

    set HOMEDRIVE=C:
    set HOMEPATH=C:\Users\username
    
### The all-in-one cluster (`oc cluster up`)

The all-in-one cluster is a local OpenShift cluster on a single machine, incorporating a registry, router, image streams and default templates. All of these run as (Docker) containers.

See all OpenShift infrastructure containers (e.g. registry, router, etc) running on your workstation:

    docker ps

Open a terminal in the `origin` container (where the all-in-one OpenShift server is located):

    docker exec -it origin bash

View logs from the `origin` container:

    docker logs origin

View the _master-config_ file in the `origin` container:

    docker exec -it origin cat /var/lib/origin/openshift.local.config/master/master-config.yaml

Edit the _master-config_ file, when using the [`oc-cluster` wrapper utility][wrapper]:

    vim ~/.oc/profiles/[profile-name]/config/master/master-config.yml

List the `kube` utils that are available in the `origin` container:

    # docker exec origin ls /usr/bin | grep kube
    kube-apiserver
    kube-controller-manager
    kubectl
    kubelet
    kube-proxy
    kubernetes
    kube-scheduler

### Problems and solutions

Q. My computer starts burning up and/or running out of RAM. Also, Java containers are hanging on startup.

- Increase the RAM available to Docker for Mac (this will require a Docker restart)
- `docker stop` any non-essential containers that you may be running _outside_ OpenShift

### General debugging

If something's not working, or not deploying:

    oc status -v

If something's still not working:

    oc get events

Changing the log level of a build:

    oc set env bc/my-build-name BUILD_LOGLEVEL=[1-5]

Problems pulling images? Check the integrated Docker registry logs:

    oc logs docker-registry-n-{xxxxx} -n default | less

## Administration and security

Grant the `admin` user permissions to administer the cluster (e.g. to create a PersistentVolume):

    oc adm policy add-cluster-role-to-user cluster-admin admin

## Bonus section: Docker!

Delete all exited Docker containers:

    docker rm $(docker ps -aq)

View the size of the Docker storage file (Docker for Mac):

    du -h -d 1 ~/Library/Containers/com.docker.docker

[os]: https://www.openshift.org/
[cdk]: https://developers.redhat.com/products/cdk/overview/
[minishift]: https://www.openshift.org/minishift/
[clusterup]: https://github.com/openshift/origin/blob/master/docs/cluster_up_down.md
[jbosstpl]: https://github.com/jboss-openshift/application-templates
[occlient]: https://github.com/openshift/origin/releases
[wrapper]: https://github.com/openshift-evangelists/oc-cluster-wrapper

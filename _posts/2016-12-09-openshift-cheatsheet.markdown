---
layout: post
title:  "OpenShift Cheat Sheet"
date:   2016-12-09 17:00:00 +0000
categories: openshift
comments: true
---

Just some useful commands for [OpenShift][os] 3.0+ (Kubernetes/Docker). To get started with OpenShift:

- get [Minishift][minishift]
- get the [Red Hat Container Development Kit][cdk]
- on a machine with Docker and the `oc` command installed, just type `oc cluster up`

NB: This is a work in progress - so if you have any commands you'd like to suggest, please add them in the comments. Thankyou!

## Starting up

[Start a simple local all-in-one OpenShift cluster][clusterup] with a configured registry, router, image streams, and default templates:

    oc cluster up

## Working with images

Import an image from an external registry:

    oc import-image --from=registry.access.redhat.com/jboss-amq-6/amq62-openshift -n openshift jboss-amq-62:1.3 --confirm

Grant permissions for a build to pull an image from another namespace:

    oc policy add-role-to-user system:image-puller system:serviceaccount:yourbuildnamespace:builder -n namespace-to-pull-from

## JBoss Middleware

Install the JBoss middleware image streams:

    oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/jboss-image-streams.json -n openshift

Install one of the [JBoss middleware templates for OpenShift][jbosstpl] (A-MQ, EAP, etc.)

    oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/amq/amq62-persistent-ssl.json -n openshift

Create a new app using one of the templates, and download dependencies from a local Maven mirror, instead of Maven Central:

    oc new-app jboss-webserver30-tomcat8-openshift~https://github.com/monodot/helloworld-gwt -e MAVEN_MIRROR_URL=http://nexus.yourcompany.com:8081/nexus/content/groups/public/

## Integrated Docker registry

Verify that the registry is up and running in the `default` namespace:

    oc get all -n default

Try redeploying the registry:

    oc deploy docker-registry --retry

## Troubleshooting/configuring a local all-in-one cluster (`oc cluster up`)

See all containers running locally:

    docker ps

Open a terminal in the `origin` container (where the all-in-one OpenShift server is located):

    docker exec -it origin bash

See logs from the `origin` container:

    docker logs origin

View the _master-config_ file in the `origin` container:

    docker exec -it origin cat /var/lib/origin/openshift.local.config/master/master-config.yaml

Edit the _master-config_ file when using the `oc-cluster` wrapper utility:

    vim ~/.oc/profiles/[profile-name]/config/master/master-config.yml

Finding what `kube` utils are available in the `origin` container:

    # docker exec origin ls /usr/bin | grep kube
    kube-apiserver
    kube-controller-manager
    kubectl
    kubelet
    kube-proxy
    kubernetes
    kube-scheduler

Q. MacBook starts burning up / running out of RAM? Java containers hanging on startup?

- Increase the RAM available to Docker for Mac (this will require a Docker restart)
- `docker stop` any non-essential containers that you may be running _outside_ OpenShift

## Debugging

If something's not working, or not deploying:

    oc status -v

If something's still not working:

    oc get events

Changing the log level of a build:

    oc set env bc/my-build-name BUILD_LOGLEVEL=[1-5]

Problems pulling images? Check the integrated Docker registry logs:

    oc logs docker-registry-n-{xxxxx} -n default | less

## Administration

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


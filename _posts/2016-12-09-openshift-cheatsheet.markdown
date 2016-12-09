---
layout: post
title:  "OpenShift Cheatsheet"
date:   2016-12-09 17:00:00 +0000
categories: openshift
comments: true
---

Just some useful commands for OpenShift (a work in progress).

## Debugging

If something's not working:

    oc get events

If something's still not working:

    oc status -v

Image pull/permissions problems - check the integrated Docker registry logs:

    oc logs docker-registry-n-xxxxx -n default | less





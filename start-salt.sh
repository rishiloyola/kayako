#!/bin/bash -x

salt-cloud -l debug -p centos-digitalocean web1
salt-cloud -l debug -p centos-digitalocean web2
salt-cloud -l debug -p centos-digitalocean lb1
salt '*' state.highstate

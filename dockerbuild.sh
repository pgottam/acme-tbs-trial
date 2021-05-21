#!/bin/bash
. demo-magic.sh
clear

##p "Let's start by creating an image. At this point we have TBS installed and docker hub registry credentials configured."
##pe "kp secret create acme-frontend --registry regisry.pgottam-demo.live --registry-user admin"
pe "docker build -t acme-fronend-with-docker /Users/praveeng/Downloads/tbs/tbs-demo/gitops/acme/acme-shopping-frontend"
##p "we named our image petclinic, set the image tag for our image repository, provided the git url, and decided what branch or commit id to build. When using a branch name TBS will always build the latest commit from that branch."
pe "docker tag acme-fronend-with-docker:latest registry.pgottam-demo.live/acme/acme-fronend-with-docker"
pe "docker push registry.pgottam-demo.live/acme/acme-fronend-with-docker"
wait
clear





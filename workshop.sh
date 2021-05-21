#!/bin/bash
. demo-magic.sh
clear

##p "Let's start by creating an image. At this point we have TBS installed and docker hub registry credentials configured."
##pe "kp secret create acme-frontend --registry regisry.pgottam-demo.live --registry-user admin"
pe "kp image create acme-shopping-frontend --tag registry.pgottam-demo.live/acme/frontend --git https://github.com/pgottam/acme-frontend-node.git --git-revision main"
##p "in the above command we created a new image object in tbs using the imperative kp command line."
##p "we named our image petclinic, set the image tag for our image repository, provided the git url, and decided what branch or commit id to build. When using a branch name TBS will always build the latest commit from that branch."
pe "kp build logs acme-shopping-frontend -b 1"
wait
clear

##kp builder create custom-builder --stack default --order small.yaml --tag registry.pgottam-demo.live/library/builders

pe "kp clusterstack update base --build-image registry.pivotal.io/tbs-dependencies/build-base@sha256:929e5083095da53546fb5cbcd7f758524a84e5d525f88f1521a4eb5b463cb142 --run-image registry.pivotal.io/tbs-dependencies/run-base@sha256:d1055171ffc6cede507067bbcff790573d9c13d70fd772f5c4f016c53e4e243c"

##pe "kp clusterstack update base --build-image registry.pivotal.io/tbs-dependencies/build-base@sha256:b788d90e57d3ce64a7144dca187cad0dace90b37e454ef07c8af9551a7f744b1 --run-image registry.pivotal.io/tbs-dependencies/run-base@sha256:891d87e0380f06152565b8c59f871750fa0535ab1c1b548112d671412fb8c4d9"
## New tab


#!/bin/bash

# EDIT name and domain
CONCOURSE_ENDPOINT=hammer.corp.local:8080
CONCOURSE_TARGET=nsx-concourse
PIPELINE_NAME=install-pks-with-nsx
CONCOURSE_USER=nsx
CONCOURSE_PW=vmware

alias fly-s="fly -t $CONCOURSE_TARGET set-pipeline -p $PIPELINE_NAME -c install-pks-pipeline.yml -l pks-params.yml"
alias fly-l="fly -t $CONCOURSE_TARGET containers | grep $PIPELINE_NAME"
alias fly-h="fly -t $CONCOURSE_TARGET hijack -b "

echo "Concourse target set to $CONCOURSE_ENDPOINT"
echo "Login using fly"
echo ""

fly --target $CONCOURSE_TARGET login -u $CONCOURSE_USER -p $CONCOURSE_PW --concourse-url http://${CONCOURSE_ENDPOINT} -n main

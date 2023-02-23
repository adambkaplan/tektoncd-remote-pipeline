#! /bin/bash

# Copyright 2023 The Tekton Remote Pipeline Contributors
#
# SPDX-License-Identifier: Apache-2.0

# Register the remote ("managed") cluster to the hub cluster

set -e

clusteradm=${CLUSTERADM_CMD:-clusteradm}
kubectl=${KUBECTL_CMD:-kubectl}

echo "Checking the CSR status of the managed clusters"
${kubectl} get csr -w --context kubectl get csr -w --context kind-hub

echo "Accepting the remote cluster on the hub"
${clusteradm} accept --clusters remote-east --context kind-hub

echo "Checking status of the managed cluster"
${kubectl} -n open-cluster-management-agent get pod --context kind-remote-east

echo "Adding application manager to remote cluster"
${kubectl} create ns open-cluster-management-agent-addon --context kind-remote-east
${clusteradm} addon enable --names application-manager --clusters remote-east --context kind-hub

echo "Checking status of application manager"
${kubectl} -n remote-east get managedclusteraddon --context kind-hub

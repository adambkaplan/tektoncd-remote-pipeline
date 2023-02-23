#! /bin/bash

# Copyright 2023 The Tekton Remote Pipeline Contributors
#
# SPDX-License-Identifier: Apache-2.0

# Bootstrap a KinD environment with a hub and remote ("managed") cluster

set -e

kind=${KIND_CMD:-kind}
clusteradm=${CLUSTERADM_CMD:-clusteradm}
kubectl=${KUBECTL_CMD:-kubectl}

echo "Creating KinD clusters 'hub' and 'remote-east'"
${kind} create cluster --name hub
${kind} create cluster --name remote-east

${clusteradm} init --wait --context kind-hub

echo "OCM Control Plane Status:"
${kubectl} -n open-cluster-management get pod --context kind-hub

echo "OCM Hub Control Plane Status:"
${kubectl} -n open-cluster-management-hub get pod --context kind-hub

echo "Adding application manager to hub cluster"
${clusteradm} install hub-addon --names application-manager --context kind-hub
${kubectl} -n open-cluster-management get deploy multicluster-operators-subscription --context kind-hub

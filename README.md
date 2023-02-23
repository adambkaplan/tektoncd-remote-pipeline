# Tekton Remote Pipelines

Run Tekton Pipelines on remote, connected clusters.

## Getting Started

### Prerequisites

- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl) and
  [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)
- [KinD](https://kind.sigs.k8s.io/)
- [clusteradm](https://open-cluster-management.io/getting-started/installation/register-a-cluster/#install-clusteradm-cli-tool)

### Setup

1. Run `hack/bootstrap-kind.sh` to create a hub cluster and remote cluster with KinD.
   This will create a hub cluster (`hub`) and one remote cluster (`remote-east`).
2. Follow the instructions from [Open Cluster Management](https://open-cluster-management.io/getting-started/installation/register-a-cluster/)
   to boostrap a Klusterlet for KinD. _Note: stop after the managed cluster_
   _issues the join command_.
3. Run `hack/register-remote.sh` to finish the setup process on the managed cluster.

See [setup](docs/setup.md) for more information.

# Setup

Reference information for the setup scripts.
## hack/boostrap-kind.sh

Script to boostrap a "hub" and "remote" cluster with KinD.

Available options (via environment variables:)

* `KIND_CMD` - provide an alternate command to run KinD. Default: `kind`
* `CLUSTERADM_CMD` - provide and alternate command to run `clusteradm`. Default: `clusteradm`
* `KUBECTL_CMD` - provide an alternate command to run `kubectl`. Default: `kubectl`

## hack/register-remote.sh

Register the remote ("managed") cluster with the hub cluster.

Available options (via environment variables:)

* `CLUSTERADM_CMD` - provide and alternate command to run `clusteradm`. Default: `clusteradm`
* `KUBECTL_CMD` - provide an alternate command to run `kubectl`. Default: `kubectl`

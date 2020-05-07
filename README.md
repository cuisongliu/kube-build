# kube-build


docker run -ti  -v /root/kube_build/kubernetes:/go/src/k8s.io/kubernetes -w /go/src/k8s.io/kubernetes \
    cuisongliu/kube-build:alpine bash

KUBE_GIT_TREE_STATE="clean"
KUBE_GIT_VERSION=v1.14.10
KUBE_BUILD_PLATFORMS=linux/amd64

make all WHAT=cmd/kubelet GOFLAGS=-v

_output/bin    

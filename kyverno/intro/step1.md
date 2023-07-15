# Kyverno Installation

## Installation via Helm

```bash
# add the repo
helm repo add kyverno https://kyverno.github.io/kyverno/
```{{exec}}

```bash
helm repo update
```{{exec}}

```bash
helm search repo kyverno -l
```{{exec}}

```bash
# High Available Installation
helm install kyverno kyverno/kyverno -n kyverno --create-namespace \
  --set admissionController.replicas=3 \
  --set backgroundController.replicas=2 \
  --set cleanupController.replicas=2 \
  --set reportsController.replicas=2
```{{exec}}

## Check the installation

```bash
# Check CRDs
k get crd | grep kyverno
```{{exec}}

```bash
# Check the pods
k get pods -n kyverno
```{{exec}}

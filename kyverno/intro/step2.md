# Create Secret and Sync to Namespaces

```bash
export DOCKER_USER=xxx
export DOCKER_PASS=xxx

kubectl create secret docker-registry regcred \
  --docker-server=docker.io \
  --docker-username=${DOCKER_USER} \
  --docker-password=${DOCKER_PASS}
```

## Sync Policy

Check the policy

```bash
batcat sync-secrets.yaml
```{{exec}}

Apply the policy

```bash
k apply -f sync-secrets.yaml
```{{exec}}

## See it in action

Create a new namespace

```bash
k create ns dev
```{{exec}}

Check the secrets in the new namespace

```bash
k get secrets -n dev
```{{exec}}

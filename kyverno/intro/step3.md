# Deployment from a Private Registry

Checkout the deployment, which uses a private docker registry:

```bash
batcat nginx-deployment.yaml
```{{exec}}

Apply it and see it stays with `ErrImagePull`:

```bash
k apply -f nginx-deployment.yaml
```{{exec}}

## Kyverno comes to help

We can make sure that imagePullSecrets is added if missing using Kyverno:

```bash
batcat add-image-pull-secrets.yaml
```{{exec}}

```bash
k apply -f add-image-pull-secrets.yaml
```{{exec}}

It will not update the current deployments, we need to replace it:

```bash
k replace -f nginx-deployment.yaml --force
```{{exec}}

Check if the pod is Ready and the imagePullSecrets is added:

```bash
k get pods -n dev
```{{exec}}

```bash
k get deployment nginx-deployment -n dev -o yaml
```{{exec}}

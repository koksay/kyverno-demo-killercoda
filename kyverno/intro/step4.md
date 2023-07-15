# Disallow latest Tag

Previous deployment used `latest` tag, but this is not the best practice.
Here is a policy to prevent it:

```bash
batcat disallow-latest-tag.yaml
```{{exec}}

Apply this policy:

```bash
k apply -f disallow-latest-tag.yaml
```{{exec}}

Now, let's try to create a new pod without a tag:

```bash
k run -it alpine --image=alpine --restart=Never -- sh
```{{exec}}

Another try with `latest` tag:

```bash
k run -it alpine --image=alpine:latest --restart=Never -- sh
```{{exec}}

We know that our nginx deployment did not have a tag, how can we see the failing objects?

> Hint: We have kyverno cli!

```bash
kyverno apply disallow-latest-tag.yaml --cluster --policy-report
```{{exec}}

We could have done it to the `nginx-deployment.yaml` before applying it:

```bash
kyverno apply disallow-latest-tag.yaml --resource nginx-deployment.yaml
```{{exec}}

Now, add tag `1.25.1` to the image, and replace the deployment:

```bash
sed -i 's/\(korayoksay\/nginx\)/\1:1.25.1/' nginx-deployment.yaml
```{{exec}}

```bash
k replace -f nginx-deployment.yaml
```{{exec}}

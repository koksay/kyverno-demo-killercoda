# Disallow latest Tag

Previous deployment used `latest` tag, but this is not the best practice.
Here is a policy to prevent it:

```bash
batcat disallow-latest-tag.yaml
```{{exec}}

Apply this and try to replace the deployment:

```bash
k apply -f disallow-latest-tag.yaml
```{{exec}}

```bash
k replace -f nginx-deployment.yaml
```{{exec}}

Now, add tag `1.25.1` to the image, and try again:

```bash
sed -i 's/\(korayoksay\/nginx\)/\1:1.25.1/' nginx-deployment.yaml
```{{exec}}

```bash
k replace -f nginx-deployment.yaml
```{{exec}}

# Namespaced Policies

Let's say you want to keep the Persistent Volumes even the Persistent Volume Claims are deleted:

```bash
batcat reclaim-policy-on-pvc-deletion.yaml
```{{exec}}

```bash
k apply -f reclaim-policy-on-pvc-deletion.yaml
```{{exec}}

```bash
k apply -f pvc.yaml 
```{{exec}}

Check the "Reclaim Policy" of the Persistent Volume:

```bash
k get pv
```{{exec}}

Apply the kyverno policy:

```bash
k apply -f reclaim-policy-on-pvc-deletion.yaml
```{{exec}}

Delete the Persistent Volume Claim, and check the Persistent Volume:

```bash
k delete -f pvc.yaml
```{{exec}}

```bash
k get pv
```{{exec}}

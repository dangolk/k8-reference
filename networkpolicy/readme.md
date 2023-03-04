## $ kubectl apply -f client-pod.yaml 
```
pod/client-pod created
```

## $ kubectl apply -f server-pod.yaml 
```
pod/server-pod created
```

## $ kubectl apply -f np-test-a-default-deny-ingress.yaml 
```
networkpolicy.networking.k8s.io/np-test-a-default-deny-ingress created
```

## $ kubectl get all -o wide -n np-test-b
```
NAME             READY   STATUS    RESTARTS   AGE   IP         NODE     NOMINATED NODE   READINESS GATES
pod/client-pod   1/1     Running   0          22m   5.5.5.14   ub18c2   <none>           <none>
```

## $ kubectl get all -o wide -n np-test-a
```
NAME             READY   STATUS    RESTARTS   AGE   IP         NODE     NOMINATED NODE   READINESS GATES
pod/server-pod   1/1     Running   0          30m   5.5.5.13   ub18c2   <none>           <none>
```

## $ kubectl get networkpolicy  -A -o yaml
```
apiVersion: v1
items:
- apiVersion: networking.k8s.io/v1
  kind: NetworkPolicy
  metadata:
    annotations:
      kubectl.kubernetes.io/last-applied-configuration: |
        {"apiVersion":"networking.k8s.io/v1","kind":"NetworkPolicy","metadata":{"annotations":{},"name":"np-test-a-default-deny-ingress","namespace":"np-test-a"},"spec":{"podSelector":{},"policyTypes":["Ingress"]}}
    creationTimestamp: "2023-03-04T23:29:15Z"
    generation: 1
    name: np-test-a-default-deny-ingress
    namespace: np-test-a
    resourceVersion: "221103"
    uid: 768a5286-04d7-4e0b-8d46-6a2a7ace12ae
  spec:
    podSelector: {}
    policyTypes:
    - Ingress
  status: {}
kind: List
metadata:
  resourceVersion: ""
```

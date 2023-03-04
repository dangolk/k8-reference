## $ kubectl apply -f client-pod.yaml 
```
pod/client-pod created
```

## $ kubectl apply -f server-pod.yaml 
```
pod/server-pod created
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


# Before Applying Network Policy
## $ kubectl logs client-pod -n np-test-b
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   615  100   615    0     0  40240      0 --:--:-- --:--:-- --:--:-- 43928
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

## $ kubectl apply -f np-test-a-default-deny-ingress.yaml 
```
networkpolicy.networking.k8s.io/np-test-a-default-deny-ingress created
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

# After Applying Network Policy
## $ kubectl logs client-pod -n np-test-b
``` 
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:02 --:--:--     0
curl: (28) Connection timed out after 2001 milliseconds
```

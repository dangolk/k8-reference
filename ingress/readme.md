## $ kubectl get ingress,all -o wide --show-labels
```
NAME                                             CLASS   HOSTS                     ADDRESS   PORTS   AGE   LABELS
ingress.networking.k8s.io/ingress-test-ingress   nginx   ingresstest.acloud.guru             80      16m   <none>

NAME                     READY   STATUS    RESTARTS   AGE   IP          NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/ingress-test-pod     1/1     Running   0          20m   5.5.5.15    ub18c2   <none>           <none>            app=ingress-test
pod/service-server-pod   1/1     Running   0          62m   5.5.5.200   ub18c1   <none>           <none>            app=service-server

NAME                           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE     SELECTOR             LABELS
service/clusterip-service      ClusterIP   10.108.163.34   <none>        8000/TCP         60m     app=service-server   <none>
service/ingress-test-service   ClusterIP   10.100.176.6    <none>        80/TCP           19m     app=ingress-test     <none>
service/kubernetes             ClusterIP   10.96.0.1       <none>        443/TCP          2d21h   <none>               component=apiserver,provider=kubernetes
service/nodeport-service       NodePort    10.98.202.47    <none>        8080:30080/TCP   47m     app=service-server   <none>
```

## $ kubectl get ingress -o yaml
```
apiVersion: v1
items:
- apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    annotations:
      kubectl.kubernetes.io/last-applied-configuration: |
        {"apiVersion":"networking.k8s.io/v1","kind":"Ingress","metadata":{"annotations":{},"name":"ingress-test-ingress","namespace":"default"},"spec":{"ingressClassName":"nginx","rules":[{"host":"ingresstest.acloud.guru","http":{"paths":[{"backend":{"service":{"name":"ingress-test-service","port":{"number":80}}},"path":"/","pathType":"Prefix"}]}}]}}
    creationTimestamp: "2023-03-06T01:42:25Z"
    generation: 1
    name: ingress-test-ingress
    namespace: default
    resourceVersion: "354181"
    uid: 31891fb4-f949-4293-adad-3500c0e129f6
  spec:
    ingressClassName: nginx
    rules:
    - host: ingresstest.acloud.guru
      http:
        paths:
        - backend:
            service:
              name: ingress-test-service
              port:
                number: 80
          path: /
          pathType: Prefix
  status:
    loadBalancer: {}
kind: List
metadata:
  resourceVersion: ""
```

## $ kubectl describe ingress ingress-test-ingress
```
Name:             ingress-test-ingress
Labels:           <none>
Namespace:        default
Address:          
Ingress Class:    nginx
Default backend:  <default>
Rules:
  Host                     Path  Backends
  ----                     ----  --------
  ingresstest.acloud.guru  
                           /   ingress-test-service:80 (5.5.5.15:80)
Annotations:               <none>
Events:                    <none>
```

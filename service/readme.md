## $ kubectl get all -o wide --show-labels
```
kubectl get all -o wide --show-labels
NAME                     READY   STATUS    RESTARTS   AGE   IP          NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/service-server-pod   1/1     Running   0          16m   5.5.5.200   ub18c1   <none>           <none>            app=service-server

NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE     SELECTOR             LABELS
service/clusterip-service   ClusterIP   10.108.163.34   <none>        8000/TCP         14m     app=service-server   <none>
service/kubernetes          ClusterIP   10.96.0.1       <none>        443/TCP          2d21h   <none>               component=apiserver,provider=kubernetes
service/nodeport-service    NodePort    10.98.202.47    <none>        8080:30080/TCP   91s     app=service-server   <none>
```

## $ kubectl get svc clusterip-service -o yaml
```
apiVersion: v1
kind: Service
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"clusterip-service","namespace":"default"},"spec":{"ports":[{"port":8000,"protocol":"TCP","targetPort":80}],"selector":{"app":"service-server"},"type":"ClusterIP"}}
  creationTimestamp: "2023-03-06T00:58:20Z"
  name: clusterip-service
  namespace: default
  resourceVersion: "350429"
  uid: 8a103e1e-1c14-4078-bcca-92f0d107f00b
spec:
  clusterIP: 10.108.163.34
  clusterIPs:
  - 10.108.163.34
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - port: 8000
    protocol: TCP
    targetPort: 80
  selector:
    app: service-server
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
```

## $ kubectl describe svc clusterip-service
```
Name:              clusterip-service
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          app=service-server
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.108.163.34
IPs:               10.108.163.34
Port:              <unset>  8000/TCP
TargetPort:        80/TCP
Endpoints:         5.5.5.200:80
Session Affinity:  None
Events:            <none>
```

## $ curl localhost:30080
```
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

## $ kubectl get svc nodeport-service -o yaml
```
apiVersion: v1
kind: Service
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"nodeport-service","namespace":"default"},"spec":{"ports":[{"nodePort":30080,"port":8080,"protocol":"TCP","targetPort":80}],"selector":{"app":"service-server"},"type":"NodePort"}}
  creationTimestamp: "2023-03-06T01:11:21Z"
  name: nodeport-service
  namespace: default
  resourceVersion: "351537"
  uid: 73a882c6-aa64-45aa-8d88-2bf5b0bfe816
spec:
  clusterIP: 10.98.202.47
  clusterIPs:
  - 10.98.202.47
  externalTrafficPolicy: Cluster
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - nodePort: 30080
    port: 8080
    protocol: TCP
    targetPort: 80
  selector:
    app: service-server
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
```

## $ kubectl describe service/nodeport-service
```
Name:                     nodeport-service
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=service-server
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.98.202.47
IPs:                      10.98.202.47
Port:                     <unset>  8080/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30080/TCP
Endpoints:                5.5.5.200:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```

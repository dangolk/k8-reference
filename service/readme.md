## $ kubectl get all -o wide --show-labels
```
NAME                     READY   STATUS    RESTARTS   AGE     IP          NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/service-server-pod   1/1     Running   0          6m14s   5.5.5.200   ub18c1   <none>           <none>            app=service-server

NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE     SELECTOR             LABELS
service/clusterip-service   ClusterIP   10.108.163.34   <none>        8000/TCP   4m14s   app=service-server   <none>
service/kubernetes          ClusterIP   10.96.0.1       <none>        443/TCP    2d20h   <none>               component=apiserver,provider=kubernetes
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

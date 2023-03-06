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

## If you want to try accessing your Service through an Ingress controller, you will need to do some additional configuration.
## First, use Helm to install the nginx Ingress controller.
```
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
kubectl create namespace nginx-ingress
helm install nginx-ingress nginx-stable/nginx-ingress -n nginx-ingress
```

## Get the cluster IP of the Ingress controller's Service.
```
kubectl get svc nginx-ingress-nginx-ingress -n nginx-ingress -o wide

NAME                          TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE   SELECTOR
nginx-ingress-nginx-ingress   LoadBalancer   10.107.224.139   <pending>     80:32188/TCP,443:30253/TCP   19m   app=nginx-ingress-nginx-ingress
```

##  $ kubectl get svc nginx-ingress-nginx-ingress -n nginx-ingress -o yaml
```
apiVersion: v1
kind: Service
metadata:
  annotations:
    meta.helm.sh/release-name: nginx-ingress
    meta.helm.sh/release-namespace: nginx-ingress
  creationTimestamp: "2023-03-06T02:02:53Z"
  labels:
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: nginx-ingress-nginx-ingress
    helm.sh/chart: nginx-ingress-0.16.2
  name: nginx-ingress-nginx-ingress
  namespace: nginx-ingress
  resourceVersion: "355968"
  uid: 12c169e2-cbcf-4e89-a9e4-8c5946ffb453
spec:
  allocateLoadBalancerNodePorts: true
  clusterIP: 10.107.224.139
  clusterIPs:
  - 10.107.224.139
  externalTrafficPolicy: Local
  healthCheckNodePort: 31356
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: http
    nodePort: 32188
    port: 80
    protocol: TCP
    targetPort: 80
  - name: https
    nodePort: 30253
    port: 443
    protocol: TCP
    targetPort: 443
  selector:
    app: nginx-ingress-nginx-ingress
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
```

## Edit your hosts file.
```
sudo vi /etc/hosts
```

## Use the cluster IP to add an entry to the hosts file.
```
10.107.224.139 ingresstest.acloud.guru
```

## Now, test your setup.
```
curl ingresstest.acloud.guru

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

## Observation: accessing directly via IP doesn't work
```
curl 10.107.224.139
<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx/1.23.3</center>
</body>
</html>
```

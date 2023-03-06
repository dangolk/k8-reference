## $ kubectl get all -A -o wide
```
NAMESPACE       NAME                                               READY   STATUS    RESTARTS        AGE     IP                NODE     NOMINATED NODE   READINESS GATES
default         pod/ingress-test-pod                               1/1     Running   0               46m     5.5.5.15          ub18c2   <none>           <none>
default         pod/service-server-pod                             1/1     Running   0               89m     5.5.5.200         ub18c1   <none>           <none>
kube-system     pod/calico-kube-controllers-74677b4c5f-f4tpw       1/1     Running   0               2d22h   5.5.5.131         ub18     <none>           <none>
kube-system     pod/calico-node-dqmh6                              1/1     Running   0               2d22h   192.168.255.133   ub18c1   <none>           <none>
kube-system     pod/calico-node-fvqkl                              1/1     Running   0               2d22h   192.168.255.129   ub18     <none>           <none>
kube-system     pod/calico-node-n6hlt                              1/1     Running   0               2d22h   192.168.255.135   ub18c2   <none>           <none>
kube-system     pod/coredns-565d847f94-dfgpz                       1/1     Running   0               2d22h   5.5.5.129         ub18     <none>           <none>
kube-system     pod/coredns-565d847f94-tj7wx                       1/1     Running   0               2d22h   5.5.5.130         ub18     <none>           <none>
kube-system     pod/etcd-ub18                                      1/1     Running   49              2d22h   192.168.255.129   ub18     <none>           <none>
kube-system     pod/kube-apiserver-ub18                            1/1     Running   0               2d3h    192.168.255.129   ub18     <none>           <none>
kube-system     pod/kube-controller-manager-ub18                   1/1     Running   3 (2d3h ago)    2d22h   192.168.255.129   ub18     <none>           <none>
kube-system     pod/kube-proxy-cz9k8                               1/1     Running   0               2d22h   192.168.255.129   ub18     <none>           <none>
kube-system     pod/kube-proxy-vwr8b                               1/1     Running   0               2d22h   192.168.255.135   ub18c2   <none>           <none>
kube-system     pod/kube-proxy-xbbpx                               1/1     Running   0               2d22h   192.168.255.133   ub18c1   <none>           <none>
kube-system     pod/kube-scheduler-ub18                            1/1     Running   47 (2d3h ago)   2d22h   192.168.255.129   ub18     <none>           <none>
kube-system     pod/metrics-server-7d9c65958-ghrmp                 1/1     Running   0               2d22h   5.5.5.193         ub18c1   <none>           <none>
nginx-ingress   pod/nginx-ingress-nginx-ingress-56f6f8d48c-sqnpx   1/1     Running   0               22m     5.5.5.201         ub18c1   <none>           <none>
np-test-a       pod/server-pod                                     1/1     Running   0               27h     5.5.5.13          ub18c2   <none>           <none>
np-test-b       pod/client-pod                                     1/1     Running   0               27h     5.5.5.14          ub18c2   <none>           <none>

NAMESPACE       NAME                                  TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE     SELECTOR
default         service/clusterip-service             ClusterIP      10.108.163.34    <none>        8000/TCP                     87m     app=service-server
default         service/ingress-test-service          ClusterIP      10.100.176.6     <none>        80/TCP                       45m     app=ingress-test
default         service/kubernetes                    ClusterIP      10.96.0.1        <none>        443/TCP                      2d22h   <none>
default         service/nodeport-service              NodePort       10.98.202.47     <none>        8080:30080/TCP               74m     app=service-server
kube-system     service/kube-dns                      ClusterIP      10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP       2d22h   k8s-app=kube-dns
kube-system     service/metrics-server                ClusterIP      10.110.137.250   <none>        443/TCP                      2d22h   k8s-app=metrics-server
nginx-ingress   service/nginx-ingress-nginx-ingress   LoadBalancer   10.107.224.139   <pending>     80:32188/TCP,443:30253/TCP   22m     app=nginx-ingress-nginx-ingress

NAMESPACE     NAME                         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE     CONTAINERS    IMAGES                               SELECTOR
kube-system   daemonset.apps/calico-node   3         3         3       3            3           kubernetes.io/os=linux   2d22h   calico-node   docker.io/calico/node:v3.25.0        k8s-app=calico-node
kube-system   daemonset.apps/kube-proxy    3         3         3       3            3           kubernetes.io/os=linux   2d22h   kube-proxy    registry.k8s.io/kube-proxy:v1.25.7   k8s-app=kube-proxy

NAMESPACE       NAME                                          READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS                    IMAGES                                            SELECTOR
kube-system     deployment.apps/calico-kube-controllers       1/1     1            1           2d22h   calico-kube-controllers       docker.io/calico/kube-controllers:v3.25.0         k8s-app=calico-kube-controllers
kube-system     deployment.apps/coredns                       2/2     2            2           2d22h   coredns                       registry.k8s.io/coredns/coredns:v1.9.3            k8s-app=kube-dns
kube-system     deployment.apps/metrics-server                1/1     1            1           2d22h   metrics-server                k8s.gcr.io/metrics-server/metrics-server:v0.6.1   k8s-app=metrics-server
nginx-ingress   deployment.apps/nginx-ingress-nginx-ingress   1/1     1            1           22m     nginx-ingress-nginx-ingress   nginx/nginx-ingress:3.0.2                         app=nginx-ingress-nginx-ingress

NAMESPACE       NAME                                                     DESIRED   CURRENT   READY   AGE     CONTAINERS                    IMAGES                                            SELECTOR
kube-system     replicaset.apps/calico-kube-controllers-74677b4c5f       1         1         1       2d22h   calico-kube-controllers       docker.io/calico/kube-controllers:v3.25.0         k8s-app=calico-kube-controllers,pod-template-hash=74677b4c5f
kube-system     replicaset.apps/coredns-565d847f94                       2         2         2       2d22h   coredns                       registry.k8s.io/coredns/coredns:v1.9.3            k8s-app=kube-dns,pod-template-hash=565d847f94
kube-system     replicaset.apps/metrics-server-7d9c65958                 1         1         1       2d22h   metrics-server                k8s.gcr.io/metrics-server/metrics-server:v0.6.1   k8s-app=metrics-server,pod-template-hash=7d9c65958
nginx-ingress   replicaset.apps/nginx-ingress-nginx-ingress-56f6f8d48c   1         1         1       22m     nginx-ingress-nginx-ingress   nginx/nginx-ingress:3.0.2                         app=nginx-ingress-nginx-ingress,pod-template-hash=56f6f8d48c

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

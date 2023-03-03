## $ kubectl get serviceaccounts -o yaml
```
apiVersion: v1
items:
- apiVersion: v1
  kind: ServiceAccount
  metadata:
    creationTimestamp: "2023-03-03T04:08:19Z"
    name: default
    namespace: default
    resourceVersion: "342"
    uid: 54fc9659-e30b-40e4-b639-f622f970600b
- apiVersion: v1
  automountServiceAccountToken: true
  kind: ServiceAccount
  metadata:
    annotations:
      kubectl.kubernetes.io/last-applied-configuration: |
        {"apiVersion":"v1","automountServiceAccountToken":true,"kind":"ServiceAccount","metadata":{"annotations":{},"name":"my-sa","namespace":"default"}}
    creationTimestamp: "2023-03-03T17:30:03Z"
    name: my-sa
    namespace: default
    resourceVersion: "68658"
    uid: 0857f9d3-61c4-4822-9ea3-e16903cc6862
kind: List
metadata:
  resourceVersion: ""
```

## $ kubectl get all -o wide
```
NAME                        READY   STATUS    RESTARTS   AGE     IP          NODE     NOMINATED NODE   READINESS GATES
pod/broken-pod              1/1     Running   0          16h     5.5.5.4     ub18c2   <none>           <none>
pod/logging-pod             1/1     Running   0          16h     5.5.5.194   ub18c1   <none>           <none>
pod/resource-consumer-pod   2/2     Running   0          17h     5.5.5.1     ub18c2   <none>           <none>
pod/sa-pod                  1/1     Running   0          3h56m   5.5.5.196   ub18c1   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   17h   <none>
```

## $ kubectl logs pod/sa-pod | head -n 25
```
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "pods is forbidden: User \"system:serviceaccount:default:my-sa\" cannot list resource \"pods\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "kind": "pods"
  },
  "code": 403
}{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "pods is forbidden: User \"system:serviceaccount:default:my-sa\" cannot list resource \"pods\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "kind": "pods"
  },
  "code": 403
}
```

## $ kubectl describe pod/sa-pod
```
Name:             sa-pod
Namespace:        default
Priority:         0
Service Account:  my-sa
Node:             ub18c1/192.168.255.133
Start Time:       Fri, 03 Mar 2023 11:34:37 -0600
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: 924d6d3379b27bfa5df32f799b4a9782eb76786c2303004c55fc3248f1f75ef1
                  cni.projectcalico.org/podIP: 5.5.5.196/32
                  cni.projectcalico.org/podIPs: 5.5.5.196/32
Status:           Running
IP:               5.5.5.196
IPs:
  IP:  5.5.5.196
Containers:
  busybox:
    Container ID:  containerd://f0206e1e0990ffafb968b36944e8c9858862c35023209e0627bda996ab1c90db
    Image:         radial/busyboxplus:curl
    Image ID:      sha256:4776f1f7d1f625c8c5173a969fdc9ae6b62655a2746aba989784bb2b7edbfe9b
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do curl -s --header "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt https://kubernetes/api/v1/namespaces/default/pods; sleep 5; done
    State:          Running
      Started:      Fri, 03 Mar 2023 11:34:40 -0600
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-cdcmq (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-cdcmq:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:                      <none>
```

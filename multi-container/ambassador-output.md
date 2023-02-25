# $ kubectl get all -o wide
```
NAME                            READY   STATUS    RESTARTS   AGE   IP                NODE     NOMINATED NODE   READINESS GATES
pod/ambassador-test             2/2     Running   0          14m   192.168.251.111   ub18c2   <none>           <none>
pod/ambassador-test-webserver   1/1     Running   0          43m   192.168.234.172   ub18c1   <none>           <none>

NAME                          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/ambassador-test-svc   ClusterIP   10.102.172.118   <none>        80/TCP    42m   app=ambassador-test
service/kubernetes            ClusterIP   10.96.0.1        <none>        443/TCP   17h   <none>
```

# $ kubectl exec -it ambassador-test -c main sh
```
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
sh: shopt: not found
[ root@ambassador-test:/ ]$ uname -air
Linux ambassador-test 4.15.0-204-generic #215-Ubuntu SMP Fri Jan 20 18:24:59 UTC 2023 x86_64 GNU/Linux
[ root@ambassador-test:/ ]$ hostname -i
192.168.251.112
[ root@ambassador-test:/ ]$ cat /etc/*release*
NAME=Buildroot
VERSION=2014.02
ID=buildroot
VERSION_ID=2014.02
PRETTY_NAME="Buildroot 2014.02"
```

# $ kubectl exec -it ambassador-test -c ambassador sh
```
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
$ uname -air
Linux ambassador-test 4.15.0-204-generic #215-Ubuntu SMP Fri Jan 20 18:24:59 UTC 2023 x86_64 GNU/Linux
$ hostname -i
192.168.251.112
$ cat /etc/*release*
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```


# $  kubectl logs pod/ambassador-test-webserver
```
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/02/25 22:20:00 [notice] 1#1: using the "epoll" event method
2023/02/25 22:20:00 [notice] 1#1: nginx/1.22.1
2023/02/25 22:20:00 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/02/25 22:20:00 [notice] 1#1: OS: Linux 4.15.0-204-generic
2023/02/25 22:20:00 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/02/25 22:20:00 [notice] 1#1: start worker processes
2023/02/25 22:20:00 [notice] 1#1: start worker process 29
192.168.19.192 - - [25/Feb/2023:22:22:05 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
2023/02/25 22:22:05 [error] 29#29: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.19.192, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "10.102.172.118:8081", referrer: "http://10.102.172.118:8081/"
192.168.19.192 - - [25/Feb/2023:22:22:05 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://10.102.172.118:8081/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
192.168.19.192 - - [25/Feb/2023:22:26:54 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
192.168.19.192 - - [25/Feb/2023:22:26:55 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
192.168.19.192 - - [25/Feb/2023:22:32:07 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
2023/02/25 22:32:07 [error] 29#29: *3 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.19.192, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "10.102.172.118", referrer: "http://10.102.172.118/"
192.168.19.192 - - [25/Feb/2023:22:32:07 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://10.102.172.118/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
192.168.19.192 - - [25/Feb/2023:22:32:11 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
192.168.19.192 - - [25/Feb/2023:22:32:14 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
192.168.255.133 - - [25/Feb/2023:22:32:37 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
2023/02/25 22:32:38 [error] 29#29: *4 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.255.133, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "10.102.172.118", referrer: "http://10.102.172.118/"
192.168.255.133 - - [25/Feb/2023:22:32:38 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://10.102.172.118/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36" "-"
```

# $ kubectl logs pod/ambassador-test -c main
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   615  100   615    0     0  34340      0 --:--:-- --:--:-- --:--:-- 36176
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

# $ kubectl logs pod/ambassador-test -c ambassador
```
[WARNING]  (1) : config : missing timeouts for frontend 'ambassador'.
   | While not properly invalid, you will certainly encounter various problems
   | with such a configuration. To fix this, please ensure that all following
   | timeouts are set to a non-zero value: 'client', 'connect', 'server'.
[WARNING]  (1) : config : missing timeouts for backend 'ambassador_test_svc'.
   | While not properly invalid, you will certainly encounter various problems
   | with such a configuration. To fix this, please ensure that all following
   | timeouts are set to a non-zero value: 'client', 'connect', 'server'.
[NOTICE]   (1) : New worker #1 (8) forked
```

# $ kubectl describe pod/ambassador-test
```
Name:             ambassador-test
Namespace:        default
Priority:         0
Service Account:  default
Node:             ub18c2/192.168.255.135
Start Time:       Sat, 25 Feb 2023 16:49:16 -0600
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: ab322a216b1cc8a634c7c232e529bb21a8887db88d35eef83eaf26f7f6900adf
                  cni.projectcalico.org/podIP: 192.168.251.111/32
                  cni.projectcalico.org/podIPs: 192.168.251.111/32
Status:           Running
IP:               192.168.251.111
IPs:
  IP:  192.168.251.111
Containers:
  main:
    Container ID:  containerd://147223e6d27058de6bc2b6026a0b3686c77fffeb663c0e676a9be814187f551d
    Image:         radial/busyboxplus:curl
    Image ID:      sha256:4776f1f7d1f625c8c5173a969fdc9ae6b62655a2746aba989784bb2b7edbfe9b
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do curl localhost:8080; sleep 5; done
    State:          Running
      Started:      Sat, 25 Feb 2023 16:49:18 -0600
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-dcrmx (ro)
  ambassador:
    Container ID:   containerd://0f8b75d014a6d91b2813f4d853c2ea480e4e9b38706061b3bd8315505085502d
    Image:          haproxy:2.4
    Image ID:       docker.io/library/haproxy@sha256:be8d7af3fabe200330b39a40042301af22c205030571c45d14d90ed63ce1a2d1
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 25 Feb 2023 16:49:18 -0600
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /usr/local/etc/haproxy/ from config (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-dcrmx (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      haproxy-config
    Optional:  false
  kube-api-access-dcrmx:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  15m   default-scheduler  Successfully assigned default/ambassador-test to ub18c2
  Normal  Pulled     15m   kubelet            Container image "radial/busyboxplus:curl" already present on machine
  Normal  Created    15m   kubelet            Created container main
  Normal  Started    15m   kubelet            Started container main
  Normal  Pulled     15m   kubelet            Container image "haproxy:2.4" already present on machine
  Normal  Created    15m   kubelet            Created container ambassador
  Normal  Started    15m   kubelet            Started container ambassador
```
 
 # $ kubectl describe pod/ambassador-test-webserver
 ```
Name:             ambassador-test-webserver
Namespace:        default
Priority:         0
Service Account:  default
Node:             ub18c1/192.168.255.133
Start Time:       Sat, 25 Feb 2023 16:19:46 -0600
Labels:           app=ambassador-test
Annotations:      cni.projectcalico.org/containerID: c3ab734c02125100cded57ce5621bc186f00f0508d0a497d5398afbf09bed003
                  cni.projectcalico.org/podIP: 192.168.234.172/32
                  cni.projectcalico.org/podIPs: 192.168.234.172/32
Status:           Running
IP:               192.168.234.172
IPs:
  IP:  192.168.234.172
Containers:
  nginx:
    Container ID:   containerd://69811ca464c95f5f135d8e1231b97e76a61320300c3340de690bcff91b195b63
    Image:          nginx:stable
    Image ID:       docker.io/library/nginx@sha256:52a6b1268e32ed5b6f59da8222f7627979bfb739f32aae3fb5b5ed31b8bf80c4
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sat, 25 Feb 2023 16:20:00 -0600
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zq6q5 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-zq6q5:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  44m   default-scheduler  Successfully assigned default/ambassador-test-webserver to ub18c1
  Normal  Pulling    44m   kubelet            Pulling image "nginx:stable"
  Normal  Pulled     44m   kubelet            Successfully pulled image "nginx:stable" in 12.536731919s
  Normal  Created    44m   kubelet            Created container nginx
  Normal  Started    44m   kubelet            Started container nginx
```

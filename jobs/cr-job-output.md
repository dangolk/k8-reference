$ kubectl get all -o wide
NAME                        READY   STATUS      RESTARTS   AGE     IP                NODE     NOMINATED NODE   READINESS GATES
pod/cr-job-27955126-tbmf7   0/1     Completed   0          2m56s   192.168.234.141   ub18c1   <none>           <none>
pod/cr-job-27955127-7rk4b   0/1     Completed   0          116s    192.168.234.142   ub18c1   <none>           <none>
pod/cr-job-27955128-nbnz2   0/1     Completed   0          56s     192.168.234.143   ub18c1   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   57m   <none>

NAME                   SCHEDULE    SUSPEND   ACTIVE   LAST SCHEDULE   AGE   CONTAINERS   IMAGES           SELECTOR
cronjob.batch/cr-job   * * * * *   False     0        56s             27m   cr-job       busybox:stable   <none>

NAME                        COMPLETIONS   DURATION   AGE     CONTAINERS   IMAGES           SELECTOR
job.batch/cr-job-27955126   1/1           5s         2m56s   cr-job       busybox:stable   controller-uid=fb1b6fc2-7d21-46c1-bec7-51833bc7e8bd
job.batch/cr-job-27955127   1/1           4s         116s    cr-job       busybox:stable   controller-uid=6333f869-f629-4a01-ba99-2e32e6f6883f
job.batch/cr-job-27955128   1/1           5s         56s     cr-job       busybox:stable   controller-uid=d74803aa-e85d-4a1b-9d6a-11079730259c


$  kubectl logs pod/cr-job-27955128-nbnz2
Sat Feb 25 06:48:01 UTC 2023
Hello from the Kubernetes cluster
Linux cr-job-27955128-nbnz2 4.15.0-204-generic #215-Ubuntu SMP Fri Jan 20 18:24:59 UTC 2023 x86_64 GNU/Linux
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: tunl0@NONE: <NOARP> mtu 1480 qdisc noop qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
4: eth0@if29: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1480 qdisc noqueue 
    link/ether e6:2e:35:26:d7:d5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.234.143/32 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::e42e:35ff:fe26:d7d5/64 scope link tentative 
       valid_lft forever preferred_lft forever
cr-job-27955128-nbnz2

$ kubectl describe pod/cr-job-27955128-nbnz2
Name:             cr-job-27955128-nbnz2
Namespace:        default
Priority:         0
Service Account:  default
Node:             ub18c1/192.168.255.133
Start Time:       Sat, 25 Feb 2023 00:48:00 -0600
Labels:           controller-uid=d74803aa-e85d-4a1b-9d6a-11079730259c
                  job-name=cr-job-27955128
Annotations:      cni.projectcalico.org/containerID: 9693c4469457a9bcc9bfea74985eb5f0652104f0cb8b75badaacad1a4ffcf658
                  cni.projectcalico.org/podIP: 
                  cni.projectcalico.org/podIPs: 
Status:           Succeeded
IP:               192.168.234.143
IPs:
  IP:           192.168.234.143
Controlled By:  Job/cr-job-27955128
Containers:
  cr-job:
    Container ID:  containerd://09fa23ff35d1e56be330403620dcbcd661e0f26bb45a83559618b3d45b68720f
    Image:         busybox:stable
    Image ID:      docker.io/library/busybox@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/sh
      -c
      date; echo Hello from the Kubernetes cluster; uname -air; ip addr;hostname
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Sat, 25 Feb 2023 00:48:01 -0600
      Finished:     Sat, 25 Feb 2023 00:48:01 -0600
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-cnrtj (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             False 
  ContainersReady   False 
  PodScheduled      True 
Volumes:
  kube-api-access-cnrtj:
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
  Normal  Scheduled  103s  default-scheduler  Successfully assigned default/cr-job-27955128-nbnz2 to ub18c1
  Normal  Pulled     102s  kubelet            Container image "busybox:stable" already present on machine
  Normal  Created    102s  kubelet            Created container cr-job
  Normal  Started    102s  kubelet            Started container cr-job
lucifer@ub18c2:~$ 

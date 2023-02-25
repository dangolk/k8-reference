#$ kubectl exec -it -n kube-system pod/kube-proxy-xpkp2 sh

#$ kubectl exec -it -n kube-system pod/calico-node-sjvwr sh
```
sh-4.4# ip addr | grep inet
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
    inet 192.168.255.129/24 brd 192.168.255.255 scope global dynamic noprefixroute ens33
    inet6 fe80::ffc2:790f:75f5:819c/64 scope link noprefixroute 
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
    inet6 fe80::42:a3ff:fee3:345f/64 scope link 
    inet 172.18.0.1/16 brd 172.18.255.255 scope global br-9064ce594f2a
    inet6 fc00:f853:ccd:e793::1/64 scope global 
    inet6 fe80::42:f5ff:fe1e:e021/64 scope link 
    inet6 fe80::1/64 scope link 
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
    inet 192.168.19.192/32 scope global tunl0

```

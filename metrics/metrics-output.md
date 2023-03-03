## $ kubectl top pod -A
```
NAMESPACE     NAME                                       CPU(cores)   MEMORY(bytes)   
default       resource-consumer-pod                      100m         7Mi             
kube-system   calico-kube-controllers-74677b4c5f-f4tpw   4m           16Mi            
kube-system   calico-node-dqmh6                          35m          87Mi            
kube-system   calico-node-fvqkl                          52m          89Mi            
kube-system   calico-node-n6hlt                          23m          89Mi            
kube-system   coredns-565d847f94-dfgpz                   2m           12Mi            
kube-system   coredns-565d847f94-tj7wx                   2m           12Mi            
kube-system   etcd-ub18                                  41m          37Mi            
kube-system   kube-apiserver-ub18                        74m          343Mi           
kube-system   kube-controller-manager-ub18               28m          46Mi            
kube-system   kube-proxy-cz9k8                           1m           15Mi            
kube-system   kube-proxy-vwr8b                           1m           14Mi            
kube-system   kube-proxy-xbbpx                           1m           14Mi            
kube-system   kube-scheduler-ub18                        5m           17Mi            
kube-system   metrics-server-7d9c65958-ghrmp             4m           15Mi         
```

## $ kubectl top node
```
NAME     CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
ub18     354m         17%    2685Mi          45%       
ub18c1   180m         18%    2244Mi          38%       
ub18c2   213m         21%    2138Mi          36%       
```

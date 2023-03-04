## $ kubectl apply -f my-configmap.yaml 
```
configmap/my-configmap created
```
## $ kubectl get configmap my-configmap -o yaml
```
apiVersion: v1
data:
  app.cfg: |
    # A configuration file
    key1=value1
    key2=value2
  message: Hello world!
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"app.cfg":"# A configuration file\nkey1=value1\nkey2=value2\n","message":"Hello world!"},"kind":"ConfigMap","metadata":{"annotations":{},"name":"my-configmap","namespace":"default"}}
  creationTimestamp: "2023-03-04T21:12:59Z"
  name: my-configmap
  namespace: default
  resourceVersion: "209412"
  uid: 00796d7b-ed6d-4849-ba98-192bee2c8b06
```

## $ kubectl describe configmap my-configmap
```
Name:         my-configmap
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
message:
----
Hello world!
app.cfg:
----
# A configuration file
key1=value1
key2=value2


BinaryData
====

Events:  <none>
```
## $ kubectl get configmap -A
```
NAMESPACE         NAME                                 DATA   AGE
default           kube-root-ca.crt                     1      41h
default           my-configmap                         2      13s
kube-node-lease   kube-root-ca.crt                     1      41h
kube-public       cluster-info                         1      41h
kube-public       kube-root-ca.crt                     1      41h
kube-system       calico-config                        4      41h
kube-system       coredns                              1      41h
kube-system       extension-apiserver-authentication   6      41h
kube-system       kube-proxy                           2      41h
kube-system       kube-root-ca.crt                     1      41h
kube-system       kubeadm-config                       1      41h
kube-system       kubelet-config                       1      41h
new-namespace     kube-root-ca.crt                     1      22h
resources-test    kube-root-ca.crt                     1      21h
```

## $ kubectl describe configmap coredns -n kube-system
```
Name:         coredns
Namespace:    kube-system
Labels:       <none>
Annotations:  <none>

Data
====
Corefile:
----
.:53 {
    errors
    health {
       lameduck 5s
    }
    ready
    kubernetes cluster.local in-addr.arpa ip6.arpa {
       pods insecure
       fallthrough in-addr.arpa ip6.arpa
       ttl 30
    }
    prometheus :9153
    forward . /etc/resolv.conf {
       max_concurrent 1000
    }
    cache 30
    loop
    reload
    loadbalance
}


BinaryData
====

Events:  <none>
```

## $ kubectl describe configmap kube-root-ca.crt
```
Name:         kube-root-ca.crt
Namespace:    default
Labels:       <none>
Annotations:  kubernetes.io/description:
                Contains a CA bundle that can be used to verify the kube-apiserver when using internal endpoints such as the internal service IP or kubern...

Data
====
ca.crt:
----
-----BEGIN CERTIFICATE-----
MIIC/jCCAeagAwIBAgIBADANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwprdWJl
cm5ldGVzMB4XDTIzMDMwMzA0MDc0OVoXDTMzMDIyODA0MDc0OVowFTETMBEGA1UE
AxMKa3ViZXJuZXRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALN5
d8N44Qe8i+PK9kaXa7dym80UbGKKk4qnP7v8qVvy0BtnMPmPm+aU95AwsvEeM1lE
AxWA+h609v1VKbg31MKDlByQI2AV91JCNSfIaB5sDU0UPafiEBc0YbJ7FgEFeacm
tgtMdtbs3cdftc3xCqR7WlxgADBGf7lBP2Y/i9BUjl0utW7MNZ1vms3pkkU+Ji8l
JGIijPoM5UshcfMQXItoeLXKWiQA8ZHx6yh8iH6Tav3EWtNV4JiV3ymF8t8tquig
GsXvg5kLYiKYG37K9adIcGb7a18Prr9imBsle1YWqTObFQ5cTbQUEifw/ta7+Ydl
3iQU787zMz7D3qy2wCcCAwEAAaNZMFcwDgYDVR0PAQH/BAQDAgKkMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0OBBYEFPHKyLFwjnPOmLmm/wNRhAdlcxucMBUGA1UdEQQO
MAyCCmt1YmVybmV0ZXMwDQYJKoZIhvcNAQELBQADggEBAHdHA2/9jb5sOkqLKzq2
wYPaVg3p1k9KhViEpNaFMz/n/hs1FC7Sj5/MHQTCYhSp6HdisY4+YjhhnEIKDvZm
UgPYbmoaAmHlt3CZ4ioaKHuo6YUqaI+zwmr7uf8oLxW0sQlP98qfjhGQ1JilPPAN
dQdVcg7XCt5iLM/I0s7eMyPKY3OKDraK2K8cGEt2OcqDplGThNH3WoM8pGlmZ6Ea
uEZmAZq5zG5CfSm8eVm66FSYUoMsCM3xrSd158FDdb0oxy42Y5piy5X1t7d+VPim
u+98SWv9ZYQATVuTUtTmubvO5OpmGkPfdhM92hsIKiserTzDmOE3SCj867dXC929
wHI=
-----END CERTIFICATE-----


BinaryData
====

Events:  <none>
```

## $ kubectl describe configmap -n kube-system kube-proxy
```
Name:         kube-proxy
Namespace:    kube-system
Labels:       app=kube-proxy
Annotations:  kubeadm.kubernetes.io/component-config.hash: sha256:0170d1ad858aa448a39af17f6b908e5183fce93e7fe2bcb2a48ec149be7de37e

Data
====
config.conf:
----
apiVersion: kubeproxy.config.k8s.io/v1alpha1
bindAddress: 0.0.0.0
bindAddressHardFail: false
clientConnection:
  acceptContentTypes: ""
  burst: 0
  contentType: ""
  kubeconfig: /var/lib/kube-proxy/kubeconfig.conf
  qps: 0
clusterCIDR: 5.5.5.5/24
configSyncPeriod: 0s
conntrack:
  maxPerCore: null
  min: null
  tcpCloseWaitTimeout: null
  tcpEstablishedTimeout: null
detectLocal:
  bridgeInterface: ""
  interfaceNamePrefix: ""
detectLocalMode: ""
enableProfiling: false
healthzBindAddress: ""
hostnameOverride: ""
iptables:
  masqueradeAll: false
  masqueradeBit: null
  minSyncPeriod: 0s
  syncPeriod: 0s
ipvs:
  excludeCIDRs: null
  minSyncPeriod: 0s
  scheduler: ""
  strictARP: false
  syncPeriod: 0s
  tcpFinTimeout: 0s
  tcpTimeout: 0s
  udpTimeout: 0s
kind: KubeProxyConfiguration
metricsBindAddress: ""
mode: ""
nodePortAddresses: null
oomScoreAdj: null
portRange: ""
showHiddenMetricsForVersion: ""
udpIdleTimeout: 0s
winkernel:
  enableDSR: false
  forwardHealthCheckVip: false
  networkName: ""
  rootHnsEndpointName: ""
  sourceVip: ""
kubeconfig.conf:
----
apiVersion: v1
kind: Config
clusters:
- cluster:
    certificate-authority: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    server: https://192.168.255.129:6443
  name: default
contexts:
- context:
    cluster: default
    namespace: default
    user: default
  name: default
current-context: default
users:
- name: default
  user:
    tokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token

BinaryData
====

Events:  <none>
```

# $ sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.25.3
```
[init] Using Kubernetes version: v1.25.3
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local ub18] and IPs [10.96.0.1 192.168.255.129]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [localhost ub18] and IPs [192.168.255.129 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [localhost ub18] and IPs [192.168.255.129 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[apiclient] All control plane components are healthy after 16.007428 seconds
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node ub18 as control-plane by adding the labels: [node-role.kubernetes.io/control-plane node.kubernetes.io/exclude-from-external-load-balancers]
[mark-control-plane] Marking the node ub18 as control-plane by adding the taints [node-role.kubernetes.io/control-plane:NoSchedule]
[bootstrap-token] Using token: x4dorx.fmyv1kndospjrxov
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] Configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] Configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] Configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] Configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.255.129:6443 --token x4dorx.fmyv1kndospjrxov \
	--discovery-token-ca-cert-hash sha256:8ed226c238241bcbc0e60816cd70c3d2fb8e6aec8f68585101eee1aee02a80d9
```

# $ kubectl describe configmap haproxy-config
```
Name:         haproxy-config
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
haproxy.cfg:
----
frontend ambassador
  bind *:8080
  default_backend ambassador_test_svc
backend ambassador_test_svc
  server svc ambassador-test-svc:8081


BinaryData
====

Events:  <none>
````

# $ kubectl describe configmap coredns -n kube-system
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

# $ kubectl describe configmap -n kube-system kube-root-ca.crt
```
Name:         kube-root-ca.crt
Namespace:    kube-system
Labels:       <none>
Annotations:  kubernetes.io/description:
                Contains a CA bundle that can be used to verify the kube-apiserver when using internal endpoints such as the internal service IP or kubern...

Data
====
ca.crt:
----
-----BEGIN CERTIFICATE-----
MIIC/jCCAeagAwIBAgIBADANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwprdWJl
cm5ldGVzMB4XDTIzMDIyNTA1NTA1MFoXDTMzMDIyMjA1NTA1MFowFTETMBEGA1UE
AxMKa3ViZXJuZXRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMu9
Kru/h0Vp490xnHS94cWBGsbjfRNL/+mxfPnwFLRWjuniADowmRp4nDRQbcs0wj8F
Cruhv+CCXPLCKnGZPtrzdc5r36B2SWAoOBIUcqy0E0foUJVouc33ZKJ0KQgBI78A
MXPpSoH80Yqa0bJDJJD9Y9nTpoTECG7CBWB+x4KzNdLxhdjkuA0FauunToLBlEwu
az/erlSSiY7bkAXemevGThTZV7ot/iYDcVVl12R07Sc8AEuD9AE/noMFzHxmu8iB
qxSmIp1vMc1O0sknpStSmbQwYysJMC9Oes2WyXzFawAPwxaM0sfNwpAO0BEyzTyP
eyDrzqY6V1SkpvAEgR8CAwEAAaNZMFcwDgYDVR0PAQH/BAQDAgKkMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0OBBYEFBoAQ6v6eIaRwH5oMyDDvGYtxj6wMBUGA1UdEQQO
MAyCCmt1YmVybmV0ZXMwDQYJKoZIhvcNAQELBQADggEBAC1UqeTIoUNUOcO0LmHw
mVTKK3pS38rhxvexUzu+ByUBywtMeh4paoyrU9Ewwsn/VGO4SdMT+vhxUNcz/nZu
qlD0YmEUkahUpEP4iZdeMH2KAFhVV5PU5OA7D69nqfT89oR0V73NoNqQgr28Z/yN
a2kKIuvH2TxIWwDzqzsBgICfcx+nHUE28GrBikMztgv14q8IcV/kFEa2LEVaGn69
oS1XOLGodQcDtf7jvGmYclhArZIdUHmaLxcRvPW/KyyzY35XIIYAlwZQ066RxsHP
EUYNVV7kDV2ar3CpSzej53jWmG3EhzuL4xOXP7AO/vNl6bAC44O5s1DDzBX0l1en
wj0=
-----END CERTIFICATE-----


BinaryData
====

Events:  <none>
```


# $ kubectl describe configmap -n kube-public cluster-info
```
Name:         cluster-info
Namespace:    kube-public
Labels:       <none>
Annotations:  <none>

Data
====
jws-kubeconfig-bfobuz:
----
eyJhbGciOiJIUzI1NiIsImtpZCI6ImJmb2J1eiJ9..SHXPmjuwEfkqXzt2Lyzz85UQJsGlvPpPN7hswROhsa8
kubeconfig:
----
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1ESXlOVEExTlRBMU1Gb1hEVE16TURJeU1qQTFOVEExTUZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTXU5CktydS9oMFZwNDkweG5IUzk0Y1dCR3NiamZSTkwvK214ZlBud0ZMUldqdW5pQURvd21ScDRuRFJRYmNzMHdqOEYKQ3J1aHYrQ0NYUExDS25HWlB0cnpkYzVyMzZCMlNXQW9PQklVY3F5MEUwZm9VSlZvdWMzM1pLSjBLUWdCSTc4QQpNWFBwU29IODBZcWEwYkpESkpEOVk5blRwb1RFQ0c3Q0JXQit4NEt6TmRMeGhkamt1QTBGYXV1blRvTEJsRXd1CmF6L2VybFNTaVk3YmtBWGVtZXZHVGhUWlY3b3QvaVlEY1ZWbDEyUjA3U2M4QUV1RDlBRS9ub01Gekh4bXU4aUIKcXhTbUlwMXZNYzFPMHNrbnBTdFNtYlF3WXlzSk1DOU9lczJXeVh6RmF3QVB3eGFNMHNmTndwQU8wQkV5elR5UApleURyenFZNlYxU2twdkFFZ1I4Q0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZCb0FRNnY2ZUlhUndINW9NeUREdkdZdHhqNndNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBQzFVcWVUSW9VTlVPY08wTG1IdwptVlRLSzNwUzM4cmh4dmV4VXp1K0J5VUJ5d3RNZWg0cGFveXJVOUV3d3NuL1ZHTzRTZE1UK3ZoeFVOY3ovblp1CnFsRDBZbUVVa2FoVXBFUDRpWmRlTUgyS0FGaFZWNVBVNU9BN0Q2OW5xZlQ4OW9SMFY3M05vTnFRZ3IyOFoveU4KYTJrS0l1dkgyVHhJV3dEenF6c0JnSUNmY3grbkhVRTI4R3JCaWtNenRndjE0cThJY1Yva0ZFYTJMRVZhR242OQpvUzFYT0xHb2RRY0R0ZjdqdkdtWWNsaEFyWklkVUhtYUx4Y1J2UFcvS3l5elkzNVhJSVlBbHdaUTA2NlJ4c0hQCkVVWU5WVjdrRFYyYXIzQ3BTemVqNTNqV21HM0VoenVMNHhPWFA3QU8vdk5sNmJBQzQ0TzVzMUREekJYMGwxZW4Kd2owPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://192.168.255.129:6443
  name: ""
contexts: null
current-context: ""
kind: Config
preferences: {}
users: null


BinaryData
====

Events:  <none>
```

# $ kubectl describe configmap -n kube-system calico-config
```
Name:         calico-config
Namespace:    kube-system
Labels:       <none>
Annotations:  <none>

Data
====
calico_backend:
----
bird
cni_network_config:
----
{
  "name": "k8s-pod-network",
  "cniVersion": "0.3.1",
  "plugins": [
    {
      "type": "calico",
      "log_level": "info",
      "log_file_path": "/var/log/calico/cni/cni.log",
      "datastore_type": "kubernetes",
      "nodename": "__KUBERNETES_NODE_NAME__",
      "mtu": __CNI_MTU__,
      "ipam": {
          "type": "calico-ipam"
      },
      "policy": {
          "type": "k8s"
      },
      "kubernetes": {
          "kubeconfig": "__KUBECONFIG_FILEPATH__"
      }
    },
    {
      "type": "portmap",
      "snat": true,
      "capabilities": {"portMappings": true}
    },
    {
      "type": "bandwidth",
      "capabilities": {"bandwidth": true}
    }
  ]
}
typha_service_name:
----
none
veth_mtu:
----
0

BinaryData
====

Events:  <none>
```

# $ kubectl describe configmap -n kube-system kube-proxy
```
Name:         kube-proxy
Namespace:    kube-system
Labels:       app=kube-proxy
Annotations:  kubeadm.kubernetes.io/component-config.hash: sha256:8204ca474001f17ef0dc7012eab0cdc873faa9e8905be788719316f735726192

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
clusterCIDR: 192.168.0.0/16
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

# $ kubectl describe configmap -n kube-system kubeadm-config
```
Name:         kubeadm-config
Namespace:    kube-system
Labels:       <none>
Annotations:  <none>

Data
====
ClusterConfiguration:
----
apiServer:
  extraArgs:
    authorization-mode: Node,RBAC
  timeoutForControlPlane: 4m0s
apiVersion: kubeadm.k8s.io/v1beta3
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
controllerManager: {}
dns: {}
etcd:
  local:
    dataDir: /var/lib/etcd
imageRepository: registry.k8s.io
kind: ClusterConfiguration
kubernetesVersion: v1.25.6
networking:
  dnsDomain: cluster.local
  podSubnet: 192.168.0.0/16
  serviceSubnet: 10.96.0.0/12
scheduler: {}


BinaryData
====

Events:  <none>
```

# $ kubectl describe configmap -n kube-system kubelet-config
```
Name:         kubelet-config
Namespace:    kube-system
Labels:       <none>
Annotations:  kubeadm.kubernetes.io/component-config.hash: sha256:000a5dd81630f64bd6f310899359dfb9e8818fc8fe011b7fdc0ec73783a42452

Data
====
kubelet:
----
apiVersion: kubelet.config.k8s.io/v1beta1
authentication:
  anonymous:
    enabled: false
  webhook:
    cacheTTL: 0s
    enabled: true
  x509:
    clientCAFile: /etc/kubernetes/pki/ca.crt
authorization:
  mode: Webhook
  webhook:
    cacheAuthorizedTTL: 0s
    cacheUnauthorizedTTL: 0s
cgroupDriver: systemd
clusterDNS:
- 10.96.0.10
clusterDomain: cluster.local
cpuManagerReconcilePeriod: 0s
evictionPressureTransitionPeriod: 0s
fileCheckFrequency: 0s
healthzBindAddress: 127.0.0.1
healthzPort: 10248
httpCheckFrequency: 0s
imageMinimumGCAge: 0s
kind: KubeletConfiguration
logging:
  flushFrequency: 0
  options:
    json:
      infoBufferSize: "0"
  verbosity: 0
memorySwap: {}
nodeStatusReportFrequency: 0s
nodeStatusUpdateFrequency: 0s
resolvConf: /run/systemd/resolve/resolv.conf
rotateCertificates: true
runtimeRequestTimeout: 0s
shutdownGracePeriod: 0s
shutdownGracePeriodCriticalPods: 0s
staticPodPath: /etc/kubernetes/manifests
streamingConnectionIdleTimeout: 0s
syncFrequency: 0s
volumeStatsAggPeriod: 0s


BinaryData
====

Events:  <none>
```

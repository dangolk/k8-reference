## $ kubectl logs pod/sa-pod 
```
{
  "kind": "PodList",
  "apiVersion": "v1",
  "metadata": {
    "resourceVersion": "91026"
  },
  "items": [
    {
      "metadata": {
        "name": "broken-pod",
        "namespace": "default",
        "uid": "bec07b4e-1f6e-48e5-801a-c3af0c2b0f15",
        "resourceVersion": "5723",
        "creationTimestamp": "2023-03-03T05:05:56Z",
        "annotations": {
          "cni.projectcalico.org/containerID": "af93b1022a87aad47e984493de3c803ab5a56cd11053b0d035f297cda8c722c3",
          "cni.projectcalico.org/podIP": "5.5.5.4/32",
          "cni.projectcalico.org/podIPs": "5.5.5.4/32",
          "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Pod\",\"metadata\":{\"annotations\":{},\"name\":\"broken-pod\",\"namespace\":\"default\"},\"spec\":{\"containers\":[{\"image\":\"nginx:1.20.1\",\"livenessProbe\":{\"httpGet\":{\"path\":\"/\",\"port\":80},\"initialDelaySeconds\":3,\"periodSeconds\":3},\"name\":\"nginx\"}]}}\n"
        },
        "managedFields": [
          {
            "manager": "kubectl-client-side-apply",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T05:05:56Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  ".": {},
                  "f:kubectl.kubernetes.io/last-applied-configuration": {}
                }
              },
              "f:spec": {
                "f:containers": {
                  "k:{\"name\":\"nginx\"}": {
                    ".": {},
                    "f:image": {},
                    "f:imagePullPolicy": {},
                    "f:livenessProbe": {
                      ".": {},
                      "f:failureThreshold": {},
                      "f:httpGet": {
                        ".": {},
                        "f:path": {},
                        "f:port": {},
                        "f:scheme": {}
                      },
                      "f:initialDelaySeconds": {},
                      "f:periodSeconds": {},
                      "f:successThreshold": {},
                      "f:timeoutSeconds": {}
                    },
                    "f:name": {},
                    "f:resources": {},
                    "f:terminationMessagePath": {},
                    "f:terminationMessagePolicy": {}
                  }
                },
                "f:dnsPolicy": {},
                "f:enableServiceLinks": {},
                "f:restartPolicy": {},
                "f:schedulerName": {},
                "f:securityContext": {},
                "f:terminationGracePeriodSeconds": {}
              }
            }
          },
          {
            "manager": "calico",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T05:05:57Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  "f:cni.projectcalico.org/containerID": {},
                  "f:cni.projectcalico.org/podIP": {},
                  "f:cni.projectcalico.org/podIPs": {}
                }
              }
            },
            "subresource": "status"
          },
          {
            "manager": "kubelet",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T05:05:59Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:status": {
                "f:conditions": {
                  "k:{\"type\":\"ContainersReady\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Initialized\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Ready\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  }
                },
                "f:containerStatuses": {},
                "f:hostIP": {},
                "f:phase": {},
                "f:podIP": {},
                "f:podIPs": {
                  ".": {},
                  "k:{\"ip\":\"5.5.5.4\"}": {
                    ".": {},
                    "f:ip": {}
                  }
                },
                "f:startTime": {}
              }
            },
            "subresource": "status"
          }
        ]
      },
      "spec": {
        "volumes": [
          {
            "name": "kube-api-access-2bk4f",
            "projected": {
              "sources": [
                {
                  "serviceAccountToken": {
                    "expirationSeconds": 3607,
                    "path": "token"
                  }
                },
                {
                  "configMap": {
                    "name": "kube-root-ca.crt",
                    "items": [
                      {
                        "key": "ca.crt",
                        "path": "ca.crt"
                      }
                    ]
                  }
                },
                {
                  "downwardAPI": {
                    "items": [
                      {
                        "path": "namespace",
                        "fieldRef": {
                          "apiVersion": "v1",
                          "fieldPath": "metadata.namespace"
                        }
                      }
                    ]
                  }
                }
              ],
              "defaultMode": 420
            }
          }
        ],
        "containers": [
          {
            "name": "nginx",
            "image": "nginx:1.20.1",
            "resources": {},
            "volumeMounts": [
              {
                "name": "kube-api-access-2bk4f",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "livenessProbe": {
              "httpGet": {
                "path": "/",
                "port": 80,
                "scheme": "HTTP"
              },
              "initialDelaySeconds": 3,
              "timeoutSeconds": 1,
              "periodSeconds": 3,
              "successThreshold": 1,
              "failureThreshold": 3
            },
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "imagePullPolicy": "IfNotPresent"
          }
        ],
        "restartPolicy": "Always",
        "terminationGracePeriodSeconds": 30,
        "dnsPolicy": "ClusterFirst",
        "serviceAccountName": "default",
        "serviceAccount": "default",
        "nodeName": "ub18c2",
        "securityContext": {},
        "schedulerName": "default-scheduler",
        "tolerations": [
          {
            "key": "node.kubernetes.io/not-ready",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          },
          {
            "key": "node.kubernetes.io/unreachable",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          }
        ],
        "priority": 0,
        "enableServiceLinks": true,
        "preemptionPolicy": "PreemptLowerPriority"
      },
      "status": {
        "phase": "Running",
        "conditions": [
          {
            "type": "Initialized",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T05:05:56Z"
          },
          {
            "type": "Ready",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T05:05:59Z"
          },
          {
            "type": "ContainersReady",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T05:05:59Z"
          },
          {
            "type": "PodScheduled",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T05:05:56Z"
          }
        ],
        "hostIP": "192.168.255.135",
        "podIP": "5.5.5.4",
        "podIPs": [
          {
            "ip": "5.5.5.4"
          }
        ],
        "startTime": "2023-03-03T05:05:56Z",
        "containerStatuses": [
          {
            "name": "nginx",
            "state": {
              "running": {
                "startedAt": "2023-03-03T05:05:58Z"
              }
            },
            "lastState": {},
            "ready": true,
            "restartCount": 0,
            "image": "docker.io/library/nginx:1.20.1",
            "imageID": "docker.io/library/nginx@sha256:a98c2360dcfe44e9987ed09d59421bb654cb6c4abe50a92ec9c912f252461483",
            "containerID": "containerd://9ad56d14bc2a4adcf940a4a035de13960ac6734c15d008453021fe33f2c50e12",
            "started": true
          }
        ],
        "qosClass": "BestEffort"
      }
    },
    {
      "metadata": {
        "name": "logging-pod",
        "namespace": "default",
        "uid": "afd7cd4b-f6ae-40be-9a69-a1367de87165",
        "resourceVersion": "4051",
        "creationTimestamp": "2023-03-03T04:47:29Z",
        "annotations": {
          "cni.projectcalico.org/containerID": "24fa9282d6f6d9e991a041f2742d9226fdc16d46c266996ef1c7f31cf9256b56",
          "cni.projectcalico.org/podIP": "5.5.5.194/32",
          "cni.projectcalico.org/podIPs": "5.5.5.194/32",
          "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Pod\",\"metadata\":{\"annotations\":{},\"name\":\"logging-pod\",\"namespace\":\"default\"},\"spec\":{\"containers\":[{\"command\":[\"sh\",\"-c\",\"while true; do echo \\\"Writing to the log!\\\"; sleep 5; done\"],\"image\":\"busybox:stable\",\"name\":\"busybox\"}]}}\n"
        },
        "managedFields": [
          {
            "manager": "kubectl-client-side-apply",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T04:47:29Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  ".": {},
                  "f:kubectl.kubernetes.io/last-applied-configuration": {}
                }
              },
              "f:spec": {
                "f:containers": {
                  "k:{\"name\":\"busybox\"}": {
                    ".": {},
                    "f:command": {},
                    "f:image": {},
                    "f:imagePullPolicy": {},
                    "f:name": {},
                    "f:resources": {},
                    "f:terminationMessagePath": {},
                    "f:terminationMessagePolicy": {}
                  }
                },
                "f:dnsPolicy": {},
                "f:enableServiceLinks": {},
                "f:restartPolicy": {},
                "f:schedulerName": {},
                "f:securityContext": {},
                "f:terminationGracePeriodSeconds": {}
              }
            }
          },
          {
            "manager": "calico",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T04:47:30Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  "f:cni.projectcalico.org/containerID": {},
                  "f:cni.projectcalico.org/podIP": {},
                  "f:cni.projectcalico.org/podIPs": {}
                }
              }
            },
            "subresource": "status"
          },
          {
            "manager": "kubelet",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T04:47:32Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:status": {
                "f:conditions": {
                  "k:{\"type\":\"ContainersReady\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Initialized\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Ready\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  }
                },
                "f:containerStatuses": {},
                "f:hostIP": {},
                "f:phase": {},
                "f:podIP": {},
                "f:podIPs": {
                  ".": {},
                  "k:{\"ip\":\"5.5.5.194\"}": {
                    ".": {},
                    "f:ip": {}
                  }
                },
                "f:startTime": {}
              }
            },
            "subresource": "status"
          }
        ]
      },
      "spec": {
        "volumes": [
          {
            "name": "kube-api-access-kw452",
            "projected": {
              "sources": [
                {
                  "serviceAccountToken": {
                    "expirationSeconds": 3607,
                    "path": "token"
                  }
                },
                {
                  "configMap": {
                    "name": "kube-root-ca.crt",
                    "items": [
                      {
                        "key": "ca.crt",
                        "path": "ca.crt"
                      }
                    ]
                  }
                },
                {
                  "downwardAPI": {
                    "items": [
                      {
                        "path": "namespace",
                        "fieldRef": {
                          "apiVersion": "v1",
                          "fieldPath": "metadata.namespace"
                        }
                      }
                    ]
                  }
                }
              ],
              "defaultMode": 420
            }
          }
        ],
        "containers": [
          {
            "name": "busybox",
            "image": "busybox:stable",
            "command": [
              "sh",
              "-c",
              "while true; do echo \"Writing to the log!\"; sleep 5; done"
            ],
            "resources": {},
            "volumeMounts": [
              {
                "name": "kube-api-access-kw452",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "imagePullPolicy": "IfNotPresent"
          }
        ],
        "restartPolicy": "Always",
        "terminationGracePeriodSeconds": 30,
        "dnsPolicy": "ClusterFirst",
        "serviceAccountName": "default",
        "serviceAccount": "default",
        "nodeName": "ub18c1",
        "securityContext": {},
        "schedulerName": "default-scheduler",
        "tolerations": [
          {
            "key": "node.kubernetes.io/not-ready",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          },
          {
            "key": "node.kubernetes.io/unreachable",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          }
        ],
        "priority": 0,
        "enableServiceLinks": true,
        "preemptionPolicy": "PreemptLowerPriority"
      },
      "status": {
        "phase": "Running",
        "conditions": [
          {
            "type": "Initialized",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:47:29Z"
          },
          {
            "type": "Ready",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:47:32Z"
          },
          {
            "type": "ContainersReady",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:47:32Z"
          },
          {
            "type": "PodScheduled",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:47:29Z"
          }
        ],
        "hostIP": "192.168.255.133",
        "podIP": "5.5.5.194",
        "podIPs": [
          {
            "ip": "5.5.5.194"
          }
        ],
        "startTime": "2023-03-03T04:47:29Z",
        "containerStatuses": [
          {
            "name": "busybox",
            "state": {
              "running": {
                "startedAt": "2023-03-03T04:47:31Z"
              }
            },
            "lastState": {},
            "ready": true,
            "restartCount": 0,
            "image": "docker.io/library/busybox:stable",
            "imageID": "docker.io/library/busybox@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39",
            "containerID": "containerd://9f92081b077f23082559c66f54d2122cf9f12d076f86cb84581aca39824659cc",
            "started": true
          }
        ],
        "qosClass": "BestEffort"
      }
    },
    {
      "metadata": {
        "name": "resource-consumer-pod",
        "namespace": "default",
        "uid": "b98f5f6e-945b-4e15-a4e5-e80f87ad537d",
        "resourceVersion": "2050",
        "creationTimestamp": "2023-03-03T04:23:44Z",
        "annotations": {
          "cni.projectcalico.org/containerID": "9ae19cecd3cd3480350481dc7ac2de72561778cb75712cfa9c03488b295ad39b",
          "cni.projectcalico.org/podIP": "5.5.5.1/32",
          "cni.projectcalico.org/podIPs": "5.5.5.1/32",
          "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Pod\",\"metadata\":{\"annotations\":{},\"name\":\"resource-consumer-pod\",\"namespace\":\"default\"},\"spec\":{\"containers\":[{\"image\":\"gcr.io/kubernetes-e2e-test-images/resource-consumer:1.5\",\"name\":\"resource-consumer\"},{\"command\":[\"sh\",\"-c\",\"until curl localhost:8080/ConsumeCPU -d \\\"millicores=100\\u0026durationSec=3600\\\";do sleep 5; done \\u0026\\u0026 while true; do sleep 10; done\"],\"image\":\"radial/busyboxplus:curl\",\"name\":\"busybox-sidecar\"}]}}\n"
        },
        "managedFields": [
          {
            "manager": "kubectl-client-side-apply",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T04:23:44Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  ".": {},
                  "f:kubectl.kubernetes.io/last-applied-configuration": {}
                }
              },
              "f:spec": {
                "f:containers": {
                  "k:{\"name\":\"busybox-sidecar\"}": {
                    ".": {},
                    "f:command": {},
                    "f:image": {},
                    "f:imagePullPolicy": {},
                    "f:name": {},
                    "f:resources": {},
                    "f:terminationMessagePath": {},
                    "f:terminationMessagePolicy": {}
                  },
                  "k:{\"name\":\"resource-consumer\"}": {
                    ".": {},
                    "f:image": {},
                    "f:imagePullPolicy": {},
                    "f:name": {},
                    "f:resources": {},
                    "f:terminationMessagePath": {},
                    "f:terminationMessagePolicy": {}
                  }
                },
                "f:dnsPolicy": {},
                "f:enableServiceLinks": {},
                "f:restartPolicy": {},
                "f:schedulerName": {},
                "f:securityContext": {},
                "f:terminationGracePeriodSeconds": {}
              }
            }
          },
          {
            "manager": "calico",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T04:23:45Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  "f:cni.projectcalico.org/containerID": {},
                  "f:cni.projectcalico.org/podIP": {},
                  "f:cni.projectcalico.org/podIPs": {}
                }
              }
            },
            "subresource": "status"
          },
          {
            "manager": "kubelet",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T04:23:57Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:status": {
                "f:conditions": {
                  "k:{\"type\":\"ContainersReady\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Initialized\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Ready\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  }
                },
                "f:containerStatuses": {},
                "f:hostIP": {},
                "f:phase": {},
                "f:podIP": {},
                "f:podIPs": {
                  ".": {},
                  "k:{\"ip\":\"5.5.5.1\"}": {
                    ".": {},
                    "f:ip": {}
                  }
                },
                "f:startTime": {}
              }
            },
            "subresource": "status"
          }
        ]
      },
      "spec": {
        "volumes": [
          {
            "name": "kube-api-access-nlq6h",
            "projected": {
              "sources": [
                {
                  "serviceAccountToken": {
                    "expirationSeconds": 3607,
                    "path": "token"
                  }
                },
                {
                  "configMap": {
                    "name": "kube-root-ca.crt",
                    "items": [
                      {
                        "key": "ca.crt",
                        "path": "ca.crt"
                      }
                    ]
                  }
                },
                {
                  "downwardAPI": {
                    "items": [
                      {
                        "path": "namespace",
                        "fieldRef": {
                          "apiVersion": "v1",
                          "fieldPath": "metadata.namespace"
                        }
                      }
                    ]
                  }
                }
              ],
              "defaultMode": 420
            }
          }
        ],
        "containers": [
          {
            "name": "resource-consumer",
            "image": "gcr.io/kubernetes-e2e-test-images/resource-consumer:1.5",
            "resources": {},
            "volumeMounts": [
              {
                "name": "kube-api-access-nlq6h",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "imagePullPolicy": "IfNotPresent"
          },
          {
            "name": "busybox-sidecar",
            "image": "radial/busyboxplus:curl",
            "command": [
              "sh",
              "-c",
              "until curl localhost:8080/ConsumeCPU -d \"millicores=100\u0026durationSec=3600\";do sleep 5; done \u0026\u0026 while true; do sleep 10; done"
            ],
            "resources": {},
            "volumeMounts": [
              {
                "name": "kube-api-access-nlq6h",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "imagePullPolicy": "IfNotPresent"
          }
        ],
        "restartPolicy": "Always",
        "terminationGracePeriodSeconds": 30,
        "dnsPolicy": "ClusterFirst",
        "serviceAccountName": "default",
        "serviceAccount": "default",
        "nodeName": "ub18c2",
        "securityContext": {},
        "schedulerName": "default-scheduler",
        "tolerations": [
          {
            "key": "node.kubernetes.io/not-ready",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          },
          {
            "key": "node.kubernetes.io/unreachable",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          }
        ],
        "priority": 0,
        "enableServiceLinks": true,
        "preemptionPolicy": "PreemptLowerPriority"
      },
      "status": {
        "phase": "Running",
        "conditions": [
          {
            "type": "Initialized",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:23:44Z"
          },
          {
            "type": "Ready",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:23:57Z"
          },
          {
            "type": "ContainersReady",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:23:57Z"
          },
          {
            "type": "PodScheduled",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T04:23:44Z"
          }
        ],
        "hostIP": "192.168.255.135",
        "podIP": "5.5.5.1",
        "podIPs": [
          {
            "ip": "5.5.5.1"
          }
        ],
        "startTime": "2023-03-03T04:23:44Z",
        "containerStatuses": [
          {
            "name": "busybox-sidecar",
            "state": {
              "running": {
                "startedAt": "2023-03-03T04:23:57Z"
              }
            },
            "lastState": {},
            "ready": true,
            "restartCount": 0,
            "image": "docker.io/radial/busyboxplus:curl",
            "imageID": "sha256:4776f1f7d1f625c8c5173a969fdc9ae6b62655a2746aba989784bb2b7edbfe9b",
            "containerID": "containerd://01ba4b5ab0d410b299535a2e4b0c534a26e5faded85465093e1839d12078329c",
            "started": true
          },
          {
            "name": "resource-consumer",
            "state": {
              "running": {
                "startedAt": "2023-03-03T04:23:52Z"
              }
            },
            "lastState": {},
            "ready": true,
            "restartCount": 0,
            "image": "gcr.io/kubernetes-e2e-test-images/resource-consumer:1.5",
            "imageID": "gcr.io/kubernetes-e2e-test-images/resource-consumer@sha256:284fcd047cdec35e1b212919bd878ba5ef72f1da12f49ddc199d219fa8b64f4a",
            "containerID": "containerd://9afc6c38f569381167aadc4c609d4fd8c03a682477e573bd1cacd20ec619b78b",
            "started": true
          }
        ],
        "qosClass": "BestEffort"
      }
    },
    {
      "metadata": {
        "name": "sa-pod",
        "namespace": "default",
        "uid": "fc9a72da-66d6-40f3-a561-9177cec3a0be",
        "resourceVersion": "91019",
        "creationTimestamp": "2023-03-03T21:53:16Z",
        "annotations": {
          "cni.projectcalico.org/containerID": "6ec0f1e6dfaedef48e4e7698f82d4c33fbbf095807fb355e31adc4e57d233495",
          "cni.projectcalico.org/podIP": "5.5.5.198/32",
          "cni.projectcalico.org/podIPs": "5.5.5.198/32",
          "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Pod\",\"metadata\":{\"annotations\":{},\"name\":\"sa-pod\",\"namespace\":\"default\"},\"spec\":{\"containers\":[{\"command\":[\"sh\",\"-c\",\"while true; do curl -s --header \\\"Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)\\\" --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt https://kubernetes/api/v1/namespaces/default/pods; sleep 5; done\"],\"image\":\"radial/busyboxplus:curl\",\"name\":\"busybox\"}],\"serviceAccountName\":\"my-sa\"}}\n"
        },
        "managedFields": [
          {
            "manager": "kubectl-client-side-apply",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T21:53:16Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  ".": {},
                  "f:kubectl.kubernetes.io/last-applied-configuration": {}
                }
              },
              "f:spec": {
                "f:containers": {
                  "k:{\"name\":\"busybox\"}": {
                    ".": {},
                    "f:command": {},
                    "f:image": {},
                    "f:imagePullPolicy": {},
                    "f:name": {},
                    "f:resources": {},
                    "f:terminationMessagePath": {},
                    "f:terminationMessagePolicy": {}
                  }
                },
                "f:dnsPolicy": {},
                "f:enableServiceLinks": {},
                "f:restartPolicy": {},
                "f:schedulerName": {},
                "f:securityContext": {},
                "f:serviceAccount": {},
                "f:serviceAccountName": {},
                "f:terminationGracePeriodSeconds": {}
              }
            }
          },
          {
            "manager": "kubelet",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T21:53:16Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:status": {
                "f:conditions": {
                  "k:{\"type\":\"ContainersReady\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:message": {},
                    "f:reason": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Initialized\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:status": {},
                    "f:type": {}
                  },
                  "k:{\"type\":\"Ready\"}": {
                    ".": {},
                    "f:lastProbeTime": {},
                    "f:lastTransitionTime": {},
                    "f:message": {},
                    "f:reason": {},
                    "f:status": {},
                    "f:type": {}
                  }
                },
                "f:containerStatuses": {},
                "f:hostIP": {},
                "f:startTime": {}
              }
            },
            "subresource": "status"
          },
          {
            "manager": "calico",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2023-03-03T21:53:17Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:annotations": {
                  "f:cni.projectcalico.org/containerID": {},
                  "f:cni.projectcalico.org/podIP": {},
                  "f:cni.projectcalico.org/podIPs": {}
                }
              }
            },
            "subresource": "status"
          }
        ]
      },
      "spec": {
        "volumes": [
          {
            "name": "kube-api-access-rh92s",
            "projected": {
              "sources": [
                {
                  "serviceAccountToken": {
                    "expirationSeconds": 3607,
                    "path": "token"
                  }
                },
                {
                  "configMap": {
                    "name": "kube-root-ca.crt",
                    "items": [
                      {
                        "key": "ca.crt",
                        "path": "ca.crt"
                      }
                    ]
                  }
                },
                {
                  "downwardAPI": {
                    "items": [
                      {
                        "path": "namespace",
                        "fieldRef": {
                          "apiVersion": "v1",
                          "fieldPath": "metadata.namespace"
                        }
                      }
                    ]
                  }
                }
              ],
              "defaultMode": 420
            }
          }
        ],
        "containers": [
          {
            "name": "busybox",
            "image": "radial/busyboxplus:curl",
            "command": [
              "sh",
              "-c",
              "while true; do curl -s --header \"Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)\" --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt https://kubernetes/api/v1/namespaces/default/pods; sleep 5; done"
            ],
            "resources": {},
            "volumeMounts": [
              {
                "name": "kube-api-access-rh92s",
                "readOnly": true,
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
              }
            ],
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "imagePullPolicy": "IfNotPresent"
          }
        ],
        "restartPolicy": "Always",
        "terminationGracePeriodSeconds": 30,
        "dnsPolicy": "ClusterFirst",
        "serviceAccountName": "my-sa",
        "serviceAccount": "my-sa",
        "nodeName": "ub18c1",
        "securityContext": {},
        "schedulerName": "default-scheduler",
        "tolerations": [
          {
            "key": "node.kubernetes.io/not-ready",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          },
          {
            "key": "node.kubernetes.io/unreachable",
            "operator": "Exists",
            "effect": "NoExecute",
            "tolerationSeconds": 300
          }
        ],
        "priority": 0,
        "enableServiceLinks": true,
        "preemptionPolicy": "PreemptLowerPriority"
      },
      "status": {
        "phase": "Pending",
        "conditions": [
          {
            "type": "Initialized",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T21:53:16Z"
          },
          {
            "type": "Ready",
            "status": "False",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T21:53:16Z",
            "reason": "ContainersNotReady",
            "message": "containers with unready status: [busybox]"
          },
          {
            "type": "ContainersReady",
            "status": "False",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T21:53:16Z",
            "reason": "ContainersNotReady",
            "message": "containers with unready status: [busybox]"
          },
          {
            "type": "PodScheduled",
            "status": "True",
            "lastProbeTime": null,
            "lastTransitionTime": "2023-03-03T21:53:16Z"
          }
        ],
        "hostIP": "192.168.255.133",
        "startTime": "2023-03-03T21:53:16Z",
        "containerStatuses": [
          {
            "name": "busybox",
            "state": {
              "waiting": {
                "reason": "ContainerCreating"
              }
            },
            "lastState": {},
            "ready": false,
            "restartCount": 0,
            "image": "radial/busyboxplus:curl",
            "imageID": "",
            "started": false
          }
        ],
        "qosClass": "BestEffort"
      }
    }
  ]
```

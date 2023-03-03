## $ kubectl get pokemon
```
NAME                 AGE
charmander-pokemon   9s
```

## $ kubectl get poke
```
NAME                 AGE
charmander-pokemon   9s
```

## $ kubectl get mon
```
NAME                 AGE
charmander-pokemon   9s
```

## $ kubectl get pokemons
```
NAME                 AGE
charmander-pokemon   9s
```

## $ kubectl get pokemon charmander-pokemon -o yaml
```
apiVersion: kd.dev/v1
kind: Pokemon
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"kd.dev/v1","kind":"Pokemon","metadata":{"annotations":{},"name":"charmander-pokemon","namespace":"default"},"spec":{"desc":"The flame on its tail indicates Charmander's life force. If it is healthy, the flame burns brightly.","gen":"I","name":"Charmander","type":"Fire"}}
  creationTimestamp: "2023-03-03T17:08:40Z"
  generation: 1
  name: charmander-pokemon
  namespace: default
  resourceVersion: "66852"
  uid: 7b1f74c4-ad7b-4409-9978-d1fdb07e142f
spec:
  desc: The flame on its tail indicates Charmander's life force. If it is healthy,
    the flame burns brightly.
  gen: I
  name: Charmander
  type: Fire
```

## $ kubectl describe pokemon charmander-pokemon
```
Name:         charmander-pokemon
Namespace:    default
Labels:       <none>
Annotations:  <none>
API Version:  kd.dev/v1
Kind:         Pokemon
Metadata:
  Creation Timestamp:  2023-03-03T17:08:40Z
  Generation:          1
  Managed Fields:
    API Version:  kd.dev/v1
    Fields Type:  FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .:
          f:kubectl.kubernetes.io/last-applied-configuration:
      f:spec:
        .:
        f:desc:
        f:gen:
        f:name:
        f:type:
    Manager:         kubectl-client-side-apply
    Operation:       Update
    Time:            2023-03-03T17:08:40Z
  Resource Version:  66852
  UID:               7b1f74c4-ad7b-4409-9978-d1fdb07e142f
Spec:
  Desc:  The flame on its tail indicates Charmander's life force. If it is healthy, the flame burns brightly.
  Gen:   I
  Name:  Charmander
  Type:  Fire
Events:  <none>
```

## $ kubectl get beehive
```
NAME          AGE
test-behive   24s
```

## $ kubectl get beehives
```
NAME          AGE
test-behive   24s
```

## $ kubectl get hive
```
NAME          AGE
test-behive   24s
```

## $ kubectl get hive -o yaml
```
apiVersion: v1
items:
- apiVersion: acloud.guru/v1
  kind: BeeHive
  metadata:
    annotations:
      kubectl.kubernetes.io/last-applied-configuration: |
        {"apiVersion":"acloud.guru/v1","kind":"BeeHive","metadata":{"annotations":{},"name":"test-behive","namespace":"default"},"spec":{"bees":60000,"supers":3}}
    creationTimestamp: "2023-03-03T16:57:30Z"
    generation: 1
    name: test-behive
    namespace: default
    resourceVersion: "65904"
    uid: 57333c6f-9bec-4f9a-acd1-66f756437d5a
  spec:
    bees: 60000
    supers: 3
kind: List
metadata:
  resourceVersion: ""
```

## $ kubectl describe beehive test-behive
```
Name:         test-behive
Namespace:    default
Labels:       <none>
Annotations:  <none>
API Version:  acloud.guru/v1
Kind:         BeeHive
Metadata:
  Creation Timestamp:  2023-03-03T16:57:30Z
  Generation:          1
  Managed Fields:
    API Version:  acloud.guru/v1
    Fields Type:  FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .:
          f:kubectl.kubernetes.io/last-applied-configuration:
      f:spec:
        .:
        f:bees:
        f:supers:
    Manager:         kubectl-client-side-apply
    Operation:       Update
    Time:            2023-03-03T16:57:30Z
  Resource Version:  65904
  UID:               57333c6f-9bec-4f9a-acd1-66f756437d5a
Spec:
  Bees:    60000
  Supers:  3
Events:    <none>
```

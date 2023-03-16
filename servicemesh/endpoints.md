```bash
$ IP=$(kubectl get pod -l app=productpage -o jsonpath='{.items[0].status.podIP}')
$ PORT=$(kubectl get pod -l app=productpage -o jsonpath='{.items[0].spec.containers[0].ports[0].containerPort}')
$ URL='http://'$IP':'$PORT'/api/v1/products/0/reviews'
$ echo $URL
http://7.7.251.69:9080/api/v1/products/0/reviews
```

$ curl -v $URL | jq
```bash
*   Trying 7.7.251.69...
* TCP_NODELAY set
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0* Connected to 7.7.251.69 (7.7.251.69) port 9080 (#0)
> GET /api/v1/products/3/reviews HTTP/1.1
> Host: 7.7.251.69:9080
> User-Agent: curl/7.58.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< content-type: application/json
< content-length: 435
< server: istio-envoy
< date: Thu, 16 Mar 2023 14:33:48 GMT
< x-envoy-upstream-service-time: 32
< x-envoy-decorator-operation: productpage.default.svc.cluster.local:9080/*
< 
{ [435 bytes data]
100   435  100   435    0     0   9062      0 --:--:-- --:--:-- --:--:--  9255
* Connection #0 to host 7.7.251.69 left intact
{
  "id": "3",
  "podname": "reviews-v3-c9c4fb987-7qb4p",
  "clustername": "null",
  "reviews": [
    {
      "reviewer": "Reviewer1",
      "text": "An extremely entertaining play by Shakespeare. The slapstick humour is refreshing!",
      "rating": {
        "stars": 5,
        "color": "red"
      }
    },
    {
      "reviewer": "Reviewer2",
      "text": "Absolutely fun and entertaining. The play lacks thematic depth when compared to other plays by Shakespeare.",
      "rating": {
        "stars": 4,
        "color": "red"
      }
    }
  ]
}
```

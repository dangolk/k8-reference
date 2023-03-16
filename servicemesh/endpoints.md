```bash
$ IP=$(kubectl get pod -l app=productpage -o jsonpath='{.items[0].status.podIP}')
$ PORT=$(kubectl get pod -l app=productpage -o jsonpath='{.items[0].spec.containers[0].ports[0].containerPort}')
$ URL='http://'$IP':'$PORT'/api/v1/products/0/reviews'
$ echo $URL
http://7.7.251.69:9080/api/v1/products/0/reviews
```

$ curl $URL
```json
{
  "id": "0",
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

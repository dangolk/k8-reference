# Log in to the control plane node.
## Add a Helm chart repository.
``` helm repo add bitnami https://charts.bitnami.com/bitnami ```
## Update the repository.
``` helm repo update ```
View a list of charts available in the repository.
helm search repo bitnami
Create a Namespace.
kubectl create namespace dokuwiki
Install a chart.
helm install --set persistence.enabled=false -n dokuwiki dokuwiki bitnami/dokuwiki
View some of the objects created by the Helm install.
kubectl get pods -n dokuwiki
kubectl get deployments -n dokuwiki
kubectl get svc -n dokuwiki
Uninstall the release and delete the Namespace to clean up.
helm uninstall -n dokuwiki dokuwiki
kubectl delete namespace dokuwiki

# Log in to the control plane node.
# Add a Helm chart repository.
``` $ helm repo add bitnami https://charts.bitnami.com/bitnami ```

# Update the repository.
## $ helm repo update
```
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "bitnami" chart repository
Update Complete. ⎈Happy Helming!⎈
```

# View a list of charts available in the repository.
## $ helm search repo bitnami 
```
NAME                                        	CHART VERSION	APP VERSION  	DESCRIPTION                                       
bitnami/airflow                             	14.0.12      	2.5.1        	Apache Airflow is a tool to express and execute...
bitnami/apache                              	9.2.16       	2.4.55       	Apache HTTP Server is an open-source HTTP serve...
bitnami/appsmith                            	0.1.14       	1.9.9        	Appsmith is an open source platform for buildin...
bitnami/argo-cd                             	4.4.11       	2.6.3        	Argo CD is a continuous delivery tool for Kuber...
bitnami/argo-workflows                      	5.1.9        	3.4.5        	Argo Workflows is meant to orchestrate Kubernet...
bitnami/aspnet-core                         	4.0.6        	7.0.3        	ASP.NET Core is an open-source framework for we...
bitnami/cassandra                           	10.0.3       	4.1.0        	Apache Cassandra is an open source distributed ...
bitnami/cert-manager                        	0.9.1        	1.11.0       	cert-manager is a Kubernetes add-on to automate...
bitnami/clickhouse                          	3.0.3        	23.2.1       	ClickHouse is an open-source column-oriented OL...
bitnami/common                              	2.2.3        	2.2.3        	A Library Helm Chart for grouping common logic ...
bitnami/concourse                           	2.0.4        	7.9.1        	Concourse is an automation system written in Go...
bitnami/consul                              	10.9.12      	1.14.4       	HashiCorp Consul is a tool for discovering and ...
bitnami/contour                             	11.0.0       	1.24.1       	Contour is an open source Kubernetes ingress co...
bitnami/contour-operator                    	4.0.0        	1.24.0       	The Contour Operator extends the Kubernetes API...
bitnami/dataplatform-bp2                    	12.0.5       	1.0.1        	DEPRECATED This Helm chart can be used for the ...
bitnami/discourse                           	10.0.2       	3.0.1        	Discourse is an open source discussion platform...
bitnami/dokuwiki                            	13.1.17      	20220731.1.0 	DokuWiki is a standards-compliant wiki optimize...
bitnami/drupal                              	13.0.6       	10.0.3       	Drupal is one of the most versatile open source...
bitnami/ejbca                               	6.3.14       	7.11.0       	EJBCA is an enterprise class PKI Certificate Au...
bitnami/elasticsearch                       	19.5.12      	8.6.2        	Elasticsearch is a distributed search and analy...
bitnami/etcd                                	8.7.5        	3.5.7        	etcd is a distributed key-value store designed ...
bitnami/external-dns                        	6.14.0       	0.13.2       	ExternalDNS is a Kubernetes addon that configur...
bitnami/fluentd                             	5.5.15       	1.15.3       	Fluentd collects events from various data sourc...
bitnami/geode                               	1.1.8        	1.15.1       	DEPRECATED Apache Geode is a data management pl...
bitnami/ghost                               	19.1.74      	5.36.0       	Ghost is an open source publishing platform des...
bitnami/gitea                               	0.1.12       	1.18.5       	Gitea is a lightweight code hosting solution. W...
bitnami/grafana                             	8.2.27       	9.3.6        	Grafana is an open source metric analytics and ...
bitnami/grafana-loki                        	2.5.8        	2.7.4        	Grafana Loki is a horizontally scalable, highly...
bitnami/grafana-mimir                       	0.1.1        	2.6.0        	Grafana Mimir is an open source, horizontally s...
bitnami/grafana-operator                    	2.7.20       	4.9.0        	Grafana Operator is a Kubernetes operator that ...
bitnami/grafana-tempo                       	2.0.1        	2.0.0        	Grafana Tempo is a distributed tracing system t...
bitnami/haproxy                             	0.6.10       	2.7.3        	HAProxy is a TCP proxy and a HTTP reverse proxy...
bitnami/haproxy-intel                       	0.2.11       	2.7.1        	DEPRECATED HAProxy for Intel is a high-performa...
bitnami/harbor                              	16.4.1       	2.7.1        	Harbor is an open source trusted cloud-native r...
bitnami/influxdb                            	5.4.16       	2.6.1        	InfluxDB(TM) is an open source time-series data...
bitnami/jaeger                              	1.0.3        	1.42.0       	Jaeger is a distributed tracing system. It is u...
bitnami/jasperreports                       	14.3.10      	8.1.0        	JasperReports Server is a stand-alone and embed...
bitnami/jenkins                             	11.0.16      	2.375.3      	Jenkins is an open source Continuous Integratio...
bitnami/joomla                              	13.3.15      	4.2.8        	Joomla! is an award winning open source CMS pla...
bitnami/jupyterhub                          	3.0.10       	3.1.1        	JupyterHub brings the power of notebooks to gro...
bitnami/kafka                               	21.0.1       	3.4.0        	Apache Kafka is a distributed streaming platfor...
bitnami/keycloak                            	13.1.1       	20.0.5       	Keycloak is a high performance Java-based ident...
bitnami/kiam                                	1.1.11       	4.2.0        	kiam is a proxy that captures AWS Metadata API ...
bitnami/kibana                              	10.2.15      	8.6.2        	Kibana is an open source, browser based analyti...
bitnami/kong                                	9.1.3        	3.2.0        	Kong is an open source Microservice API gateway...
bitnami/kube-prometheus                     	8.3.9        	0.63.0       	Prometheus Operator provides easy monitoring de...
bitnami/kube-state-metrics                  	3.3.2        	2.8.1        	kube-state-metrics is a simple service that lis...
bitnami/kubeapps                            	12.2.5       	2.6.3        	Kubeapps is a web-based UI for launching and ma...
bitnami/kubernetes-event-exporter           	2.2.2        	1.1.0        	Kubernetes Event Exporter makes it easy to expo...
bitnami/logstash                            	5.1.14       	8.6.2        	Logstash is an open source data processing engi...
bitnami/magento                             	21.1.14      	2.4.5-p1     	Magento is a powerful open source e-commerce pl...
bitnami/mariadb                             	11.5.0       	10.6.12      	MariaDB is an open source, community-developed ...
bitnami/mariadb-galera                      	7.5.0        	10.6.12      	MariaDB Galera is a multi-primary database clus...
bitnami/mastodon                            	1.1.0        	4.1.0        	Mastodon is self-hosted social network server b...
bitnami/matomo                              	0.2.25       	4.13.3       	Matomo, formerly known as Piwik, is a real time...
bitnami/mediawiki                           	14.3.15      	1.39.2       	MediaWiki is the free and open source wiki soft...
bitnami/memcached                           	6.3.7        	1.6.18       	Memcached is an high-performance, distributed m...
bitnami/metallb                             	4.1.16       	0.13.7       	MetalLB is a load-balancer implementation for b...
bitnami/metrics-server                      	6.2.11       	0.6.2        	Metrics Server aggregates resource usage data, ...
bitnami/minio                               	12.1.8       	2023.2.22    	MinIO(R) is an object storage server, compatibl...
bitnami/mongodb                             	13.8.1       	6.0.4        	MongoDB(R) is a relational open source NoSQL da...
bitnami/mongodb-sharded                     	6.2.4        	6.0.4        	MongoDB(R) is an open source NoSQL database tha...
bitnami/moodle                              	14.3.9       	4.1.1        	Moodle(TM) LMS is an open source online Learnin...
bitnami/mxnet                               	3.1.10       	1.9.1        	Apache MXNet (Incubating) is a flexible and eff...
bitnami/mysql                               	9.5.0        	8.0.32       	MySQL is a fast, reliable, scalable, and easy t...
bitnami/nats                                	7.5.10       	2.9.14       	NATS is an open source, lightweight and high-pe...
bitnami/nginx                               	13.2.27      	1.23.3       	NGINX Open Source is a web server that can be a...
bitnami/nginx-ingress-controller            	9.3.31       	1.6.4        	NGINX Ingress Controller is an Ingress controll...
bitnami/nginx-intel                         	2.1.15       	0.4.9        	DEPRECATED NGINX Open Source for Intel is a lig...
bitnami/node                                	19.1.7       	16.18.0      	DEPRECATED Node.js is a runtime environment bui...
bitnami/node-exporter                       	3.3.1        	1.5.0        	Prometheus exporter for hardware and OS metrics...
bitnami/oauth2-proxy                        	3.4.7        	7.4.0        	A reverse proxy and static file server that pro...
bitnami/odoo                                	23.0.8       	16.0.20221115	Odoo is an open source ERP and CRM platform, fo...
bitnami/opencart                            	13.0.8       	4.0.1-1      	OpenCart is free open source ecommerce platform...
bitnami/osclass                             	14.2.13      	8.1.1        	Osclass allows you to easily create a classifie...
bitnami/owncloud                            	12.2.11      	10.11.0      	DEPRECATED ownCloud is an open source content c...
bitnami/parse                               	20.0.2       	6.0.0        	Parse is a platform that enables users to add a...
bitnami/phpbb                               	12.3.11      	3.3.10       	phpBB is a popular bulletin board that features...
bitnami/phpmyadmin                          	10.4.3       	5.2.1        	phpMyAdmin is a free software tool written in P...
bitnami/pinniped                            	1.0.6        	0.22.0       	Pinniped is an identity service provider for Ku...
bitnami/postgresql                          	12.2.1       	15.2.0       	PostgreSQL (Postgres) is an open source object-...
bitnami/postgresql-ha                       	11.1.3       	15.2.0       	This PostgreSQL cluster solution includes the P...
bitnami/prestashop                          	16.0.4       	8.0.1        	PrestaShop is a powerful open source eCommerce ...
bitnami/pytorch                             	2.5.14       	1.13.1       	PyTorch is a deep learning platform that accele...
bitnami/rabbitmq                            	11.10.0      	3.11.9       	RabbitMQ is an open source general-purpose mess...
bitnami/rabbitmq-cluster-operator           	3.2.4        	2.1.0        	The RabbitMQ Cluster Kubernetes Operator automa...
bitnami/redis                               	17.8.0       	7.0.8        	Redis(R) is an open source, advanced key-value ...
bitnami/redis-cluster                       	8.3.8        	7.0.8        	Redis(R) is an open source, scalable, distribut...
bitnami/redmine                             	21.0.7       	5.0.4        	Redmine is an open source management applicatio...
bitnami/schema-registry                     	8.0.7        	7.3.2        	Confluent Schema Registry provides a RESTful in...
bitnami/sealed-secrets                      	1.2.7        	0.19.5       	Sealed Secrets are "one-way" encrypted K8s Secr...
bitnami/solr                                	7.1.4        	9.1.1        	Apache Solr is an extremely powerful, open sour...
bitnami/sonarqube                           	2.1.2        	9.9.0        	SonarQube(TM) is an open source quality managem...
bitnami/spark                               	6.3.17       	3.3.2        	Apache Spark is a high-performance engine for l...
bitnami/spring-cloud-dataflow               	15.0.4       	2.10.0       	Spring Cloud Data Flow is a microservices-based...
bitnami/suitecrm                            	11.2.10      	7.13.1       	SuiteCRM is a completely open source, enterpris...
bitnami/supabase                            	0.1.1        	0.23.1       	Supabase is an open source Firebase alternative...
bitnami/tensorflow-resnet                   	3.6.12       	2.11.0       	TensorFlow ResNet is a client utility for use w...
bitnami/thanos                              	12.1.0       	0.30.2       	Thanos is a highly available metrics system tha...
bitnami/tomcat                              	10.5.16      	10.1.5       	Apache Tomcat is an open-source web server desi...
bitnami/wavefront                           	4.2.11       	1.13.0       	Wavefront is a high-performance streaming analy...
bitnami/wavefront-adapter-for-istio         	2.0.6        	0.1.5        	DEPRECATED Wavefront Adapter for Istio is an ad...
bitnami/wavefront-hpa-adapter               	1.3.10       	0.9.9        	Wavefront HPA Adapter for Kubernetes is a Kuber...
bitnami/wavefront-prometheus-storage-adapter	2.1.10       	1.0.5        	Wavefront Storage Adapter is a Prometheus integ...
bitnami/wildfly                             	14.2.0       	27.0.1       	Wildfly is a lightweight, open source applicati...
bitnami/wordpress                           	15.2.46      	6.1.1        	WordPress is the world's most popular blogging ...
bitnami/wordpress-intel                     	2.1.31       	6.1.1        	DEPRECATED WordPress for Intel is the most popu...
bitnami/zookeeper                           	11.1.3       	3.8.1        	Apache ZooKeeper provides a reliable, centraliz...
```

# Create a Namespace.
## $ kubectl create namespace dokuwiki 
```
namespace/dokuwiki created
```

# Install a chart.
## $ helm install --set persistence.enabled=false -n dokuwiki dokuwiki bitnami/dokuwiki 
```
NAME: dokuwiki
LAST DEPLOYED: Mon Feb 27 19:18:59 2023
NAMESPACE: dokuwiki
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: dokuwiki
CHART VERSION: 13.1.17
APP VERSION: 20220731.1.0

** Please be patient while the chart is being deployed **

1. Get the DokuWiki URL by running:

** Please ensure an external IP is associated to the dokuwiki service before proceeding **
** Watch the status using: kubectl get svc --namespace dokuwiki -w dokuwiki **

  export SERVICE_IP=$(kubectl get svc --namespace dokuwiki dokuwiki --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
  echo "URL: http://$SERVICE_IP/"

2. Login with the following credentials

  echo Username: user
  echo Password: $(kubectl get secret --namespace dokuwiki dokuwiki -o jsonpath="{.data.dokuwiki-password}" | base64 -d)
```

# View some of the objects created by the Helm install.
## $ kubectl get all -n dokuwiki -o wide
```
NAME                            READY   STATUS    RESTARTS   AGE     IP            NODE     NOMINATED NODE   READINESS GATES
pod/dokuwiki-846dd8d964-km2ll   1/1     Running   0          4h27m   2.2.234.177   ub18c1   <none>           <none>

NAME               TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE     SELECTOR
service/dokuwiki   LoadBalancer   10.107.176.239   <pending>     80:31560/TCP,443:31959/TCP   4h27m   app.kubernetes.io/instance=dokuwiki,app.kubernetes.io/name=dokuwiki

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES                                                  SELECTOR
deployment.apps/dokuwiki   1/1     1            1           4h27m   dokuwiki     docker.io/bitnami/dokuwiki:20220731.1.0-debian-11-r60   app.kubernetes.io/instance=dokuwiki,app.kubernetes.io/name=dokuwiki

NAME                                  DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES                                                  SELECTOR
replicaset.apps/dokuwiki-846dd8d964   1         1         1       4h27m   dokuwiki     docker.io/bitnami/dokuwiki:20220731.1.0-debian-11-r60   app.kubernetes.io/instance=dokuwiki,app.kubernetes.io/name=dokuwiki,pod-template-hash=846dd8d964
```

# Uninstall the release and delete the Namespace to clean up.
## $ helm uninstall -n dokuwiki dokuwiki
## $ kubectl delete namespace dokuwiki

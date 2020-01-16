# TeaStore #

All credit to the original creators - https://github.com/DescartesResearch/TeaStore

## Setup
There are a bunch of handy setup scripts located in `/scripts`. These should be enough to get the application running in monolithic but also microservice architectures.

* You will need Docker, JDK and Maven installed
* Run `mvn clean install -DskipTests`. This creates the WAR files used by TomCat but more importantly the Docker files
* Build the TeaStore base Docker image. This is required first before building any other Docker images (NOTE: These have to run on the projects root directory) `bash ./scripts/docker_build_base.sh`. You should teastore:base listed as a Docker image.

### We deploy the application to Kubernetes
There a bunch of Kubernetes `.yaml` scripts for deployment in the /scripts/k8s folder follow the steps to run as a microservice or monolothic
* Launch rabbitmq deployments `kubectl create -f teastore-rabbitmq.yaml`
* Run as monolithic `kubectl create -f teastore-monolithic.yaml`
* Run as microservice `kubectl create -f teastore-microservice.yaml`
* Go to `K8S_CLUSTER_IP:30080/tools.descartes.teastore.webui/` the application should be working

### JMeter
JMeter is our load testing tool. It can be installed using HomeBrew.
* `brew install jmeter`
* Start JMeter `open /usr/local/bin/jmeter`

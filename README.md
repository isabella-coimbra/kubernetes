# Description

Project to use Kubernetes in many different platforms.

## Requirements

- [Docker](https://docs.docker.com/desktop/mac/apple-silicon/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)
- [Terraform](https://www.terraform.io/downloads)
- An account in GCP.

## Enable Cloud Run API

Run stateless HTTP containers on a fully managed environment.

For enable Cloud Run API the link of documentaion: https://console.cloud.google.com/apis/api/run.googleapis.com/overview

## Enable Container Registry API

Google Container Registry provides secure, private Docker image storage on Google Cloud Platform. 

For enable Container Registry API the link of documentaion: https://console.developers.google.com/apis/api/containerregistry.googleapis.com/overview

## Terraform
In the folder to the repositorie we need to run the command:

``` ssh
terraform init
```
The above command will initialize the modules and the backend.

If this is the first time you are uploading the environment, it is important to run the command:

``` ssh
terraforming plan
```
It will show the execution plan with all the settings chosen in the ```main.tf``` file. So if all the settings are correct just run the command

 ``` ssh
terraform apply
 ```

If the environment is running on AWS and you want to see its settings, just run the command:

``` ssh
show terraform
```

## Inputs

|Name|Description|Type|Default|Optional|
|:-:|:-:|:-:|:-:|:-:|
|project|The name of project|string|--|No|
|region|Region of the instance|string|us-east-1|Yes|

## Build Docker Image to Container Registry

For build the Docker image and push it to the project’s container registry, execute the following commands within it’s directory.

``` ssh
$ docker build -t docker push gcr.io/<project_name>/app  .
$ docker push docker push gcr.io/<project_name>/app 
```
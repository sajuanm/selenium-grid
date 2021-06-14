# selenium-grid

## Introduction
This project is a PoC to test the capabilities of Selenium Grid.
You will find:
* A folder to test Selenium Grid version 3 in an AWS environment of Elastic Container Service
* A folder to test Selenium Grid version 4 in a local environment
* A Pyhon project to test the capabilities of Selenium Grid, where we will take a screenshot of 100 webpages and we will measure the execution time.

# Concepts

## What is Selenium?
Selenium is an umbrella project for a range of tools and libraries that enable and support the automation of web browsers. 
It allows users to simulate common activities performed by end-users; entering text into fields, selecting drop-down values and checking boxes, and clicking links in documents.
It also provides many other controls such as mouse movement, arbitrary JavaScript execution, and much more.

### Remote WebDriver
You can use WebDriver remotely the same way you would use it locally. The primary difference is that a remote WebDriver needs to be configured so that it can run your tests on a separate machine.

A remote WebDriver is composed of two pieces: a client and a server. The client is your WebDriver test and the server is simply a Java servlet, which can be hosted in any modern JEE app server.

### Grid
Selenium Grid allows the execution of WebDriver scripts on remote machines (virtual or real) by routing commands sent by the client to remote browser instances. It aims to provide an easy way to run tests in parallel on multiple machines.

Selenium Grid allows us to run tests in parallel on multiple machines, and to manage different browser versions and browser configurations centrally (instead of in each individual test).

Selenium Grid is not a silver bullet. It solves a subset of common delegation and distribution problems, but will for example not manage your infrastructure, and might not suit your specific needs.

### More info
https://www.selenium.dev/documentation/en/

## What is ECS?
Amazon Elastic Container Service (Amazon ECS) is a fully managed container orchestration service that helps you easily deploy, manage, and scale containerized applications. It deeply integrates with the rest of the AWS platform to provide a secure and easy-to-use solution for running container workloads in the cloud and now on your infrastructure with Amazon ECS Anywhere.

Amazon ECS leverages serverless technology from AWS Fargate to deliver autonomous container operations, which reduces the time spent on configuration, patching, and security. Instead of worrying about managing the control plane, add-ons, and nodes, Amazon ECS enables you to rapidly build applications and grow your business.

## Features of Amazon ECS

Amazon ECS is a regional service that simplifies running containers in a highly available manner across multiple Availability Zones within a Region. You can create Amazon ECS clusters within a new or existing VPC. After a cluster is up and running, you can create task definitions that define which container images run across your clusters. Your task definitions are used to run tasks or create services. Container images are stored in and pulled from container registries, for example, the Amazon Elastic Container Registry.

The following diagram shows the architecture of an Amazon ECS environment run on AWS Fargate.

![alt text](https://github.com/sajuanm/selenium-grid/blob/master/images/overview-fargate.png)

## Containers and images
To deploy applications on Amazon ECS, your application components must be architected to run in containers. A container is a standardized unit of software development that contains everything that your software application needs to run, including relevant code, runtime, system tools, and system libraries. Containers are created from a read-only template called an image.

Images are typically built from a Dockerfile, which is a plaintext file that specifies all of the components that are included in the container. After being built, these images are stored in a registry where they then can be downloaded and run on your cluster. For more information about container technology, see Docker basics for Amazon ECS.

![alt text](https://github.com/sajuanm/selenium-grid/blob/master/images/overview-containers.png)

## Task definitions
To prepare your application to run on Amazon ECS, you must create a task definition. The task definition is a text file (in JSON format) that describes one or more containers (up to a maximum of ten) that form your application. The task definition can be thought of as a blueprint for your application. It specifies various parameters for your application. For example, these parameters can be used to indicate which containers should be used, which ports should be opened for your application, and what data volumes should be used with the containers in the task. The specific parameters available for your task definition depend on the needs of your specific application. For more information about creating task definitions, see Amazon ECS task definitions.


## Tasks and scheduling
A task is the instantiation of a task definition within a cluster. After you have created a task definition for your application within Amazon ECS, you can specify the number of tasks to run on your cluster.

The Amazon ECS task scheduler is responsible for placing tasks within your cluster. There are several different scheduling options available. For example, you can define a service that runs and maintains a specified number of tasks simultaneously. 
For more information about the different scheduling options available, see Scheduling Amazon ECS tasks.

![alt text](https://github.com/sajuanm/selenium-grid/blob/master/images/overview-service-fargate.png)

## Clusters
An Amazon ECS cluster is a logical grouping of tasks or services. You can register one or more Amazon EC2 instances (also referred to as container instances) with your cluster to run tasks on them. Or, you can use the serverless infrastructure that Fargate provides to run tasks. When your tasks are run on Fargate, your cluster resources are also managed by Fargate.

When you first use Amazon ECS, a default cluster is created for you. You can create additional clusters in an account to keep your resources separate.

For more information about creating clusters, see Amazon ECS clusters. For more information about launching container instances and registering them with your clusters, see Amazon ECS container instances.

## Container agent
The container agent runs on each container instance within an Amazon ECS cluster. The agent sends information about the resource's current running tasks and resource utilization to Amazon ECS. It starts and stops tasks whenever it receives a request from Amazon ECS. For more information, see Amazon ECS container agent.

![alt text ](https://github.com/sajuanm/selenium-grid/blob/master/images/overview-containeragent-fargate.png)


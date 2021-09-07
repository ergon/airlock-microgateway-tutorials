# Airlock Microgateway Tutorials
In this tutorial, you will learn how to protect your web applications and services using the Airlock Microgateway.

We will add additional tutorials over time, so make sure to come back from time to time.


## Airlock Microgateway
The *Airlock Microgateway* is a component of the [Airlock Secure Access Hub].
It is the lightweight, container-based deployment form of the *Airlock Gateway*, a software appliance with reverse-proxy, Web Application Firewall (WAF) and API security functionality.


## About Ergon
*Airlock* is a registered trademark of [Ergon]. Ergon is a Swiss leader in leveraging digitalisation to create unique and effective client benefits, from conception to market, the result of which is the international distribution of globally revered products.

## Table of contents
- [Airlock Microgateway Tutorials](#airlock-microgateway-tutorials)
  - [Airlock Microgateway](#airlock-microgateway)
  - [About Ergon](#about-ergon)
  - [Table of contents](#table-of-contents)
- [Setup the Environment](#setup-the-environment)
- [The Tutorials](#the-tutorials)
  - [Tutorial Overview](#tutorial-overview)
- [Additional Information](#additional-information)


# Setup the Environment
You need a Kubernetes cluster to run this tutorial. You can use [Minikube][Minikube start] to create one, if you do not have a cluster available.

The [kubectl command-line tool][Kubectl] has to be configured for the cluster you intend to use.

You can find additional information in our [lab guide][Microgateway Lab Guide].


# The Tutorials
The tutorials are intended to show different aspects of running and configuring the Airlock Microgateway. The tutorials are independent of each other and can be done in any order.

Each tutorial consists of
- an Exercise folder. The exercise is accompanied by a [lab guide][Microgateway Lab Guide] with detailed instructions and hints. In most cases, kubernetes resource files have to be updated and deployed in order to solve the exercise.
- a Solution folder containing a potential solution for the exercise.

## Tutorial Overview
Tutorial | Goal | Lab Guide
--- | --- | ---
Getting Started | Deploy the Microgateway and get familiar with it's components|[Lab Guide](https://docs.airlock.com/microgateway/nightly/#data/gettingstart_1.html)
Getting Used to DSL | Configure the Microgateway to protect a simple backend service |[Lab Guide](https://docs.airlock.com/microgateway/nightly/#data/gettingusedt.html)


# Additional Information
[Airlock Microgateway Lab Guide][Microgateway Lab Guide]

[Airlock Microgateway Documentation][Microgateway Documentation]

[Airlock Forum][Airlock Forum]



[Airlock Secure Access Hub]: https://www.airlock.com/

[Ergon]: https://www.ergon.ch/

[Airlock Forum]: https://forum.airlock.com

[Microgateway Documentation]: https://docs.airlock.com/microgateway/latest/

[Microgateway Lab Guide]: https://docs.airlock.com/microgateway/latest/#data/tutorials.html

[Minikube start]: https://minikube.sigs.k8s.io/docs/start/

[Kubectl]: https://kubernetes.io//docs/tasks/tools/
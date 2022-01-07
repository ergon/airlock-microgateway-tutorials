# Airlock Microgateway Tutorials
In this tutorial, you will learn how to protect your web applications and services using the Airlock Microgateway.

We will add additional tutorials over time, so make sure to come back from time to time.

This tutorial works with the latest version of Airlock Microgateway 3.1. Check out released versions of the tutorial if you want to use it with another Airlock Microgateway version.

## Airlock Microgateway
The *Airlock Microgateway* is a component of the [Airlock Secure Access Hub].
It is the lightweight, container-based deployment form of the *Airlock Gateway*, a software appliance with reverse-proxy, Web Application Firewall (WAF) and API security functionality.


# The Tutorials
The tutorials are intended to show different aspects of running and configuring the Airlock Microgateway. The tutorials are independent of each other and can be done in any order.

Each tutorial consists of
- an *exercise* folder. The exercise is accompanied by a [guide][Microgateway Tutorials] with detailed instructions and hints. In most cases, Kubernetes resource files have to be updated and deployed in order to solve the exercise.
- a *solution* folder containing a potential solution for the exercise.

The Kubernetes resources created for the exercises have the labels *purpose: microgateway-tutorial*. Therefore, it is easy to distinguish which resources have been created while proceeding the exercises.

Please consult the [Microgateway Tutorials] for a list of tutorials and the topics covered.

# Setup the Environment
You need a Kubernetes cluster to run this tutorial. You can use [Minikube][Minikube start] to create one, if you do not have a cluster available.

The [kubectl][Kubectl] command-line tool has to be configured for the cluster you intend to use.

You can find additional information in our [guide][Microgateway Tutorials].

# Additional Information
- Guide for the Tutorials: [Airlock Microgateway Tutorials][Microgateway Tutorials]
- Introduction: [Airlock Microgateway](https://www.airlock.com/microgateway)
- Documentation: [Airlock Microgateway Manual][Microgateway Documentation]
- Community Support: [Airlock Community Forum][Airlock Forum]
- Integration Example: [Airlock Minikube Example](https://github.com/ergon/airlock-minikube-example)

## About Ergon
*Airlock* is a registered trademark of [Ergon](https://www.ergon.ch). Ergon is a Swiss leader in leveraging digitalisation to create unique and effective client benefits, from conception to market, the result of which is the international distribution of globally revered products.



[Airlock Secure Access Hub]: https://www.airlock.com/

[Ergon]: https://www.ergon.ch/

[Airlock Forum]: https://forum.airlock.com

[Microgateway Documentation]: https://docs.airlock.com/microgateway/latest/

[Microgateway Tutorials]: https://docs.airlock.com/microgateway/latest/#data/tutorials.html

[Minikube start]: https://minikube.sigs.k8s.io/docs/start/

[Kubectl]: https://kubernetes.io//docs/tasks/tools/
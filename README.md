# Airlock Microgateway Tutorials
In this tutorial, you will learn how to protect your web applications and services using the Airlock Microgateway.

We will add additional tutorials over time, so make sure to come back from time to time.


## Airlock Microgateway
The *Airlock Microgateway* is a component of the [Airlock Secure Access Hub].
It is the lightweight, container-based deployment form of the *Airlock Gateway*, a software appliance with reverse-proxy, Web Application Firewall (WAF) and API security functionality.


## About Ergon
*Airlock* is a registered trademark of [Ergon]. Ergon is a Swiss leader in leveraging digitalisation to create unique and effective client benefits, from conception to market, the result of which is the international distribution of globally revered products.

# The Tutorials
The tutorials are intended to show different aspects of running and configuring the Airlock Microgateway. The tutorials are independent of each other and can be done in any order.

Each tutorial consists of
- an Exercise folder. The exercise is accompanied by a [lab guide][Microgateway Lab Guide] with detailed instructions and hints. In most cases, kubernetes resource files have to be updated and deployed in order to solve the exercise.
- a Solution folder containing a potential solution for the exercise.

Please consult the [Microgateway Lab Guide] for a list of tutorials and the topics covered.

# Setup the Environment
You need a Kubernetes cluster to run this tutorial. You can use [Minikube][Minikube start] to create one, if you do not have a cluster available.

The [kubectl command-line tool][Kubectl] has to be configured for the cluster you intend to use.

You can find additional information in our [lab guide][Microgateway Lab Guide].

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
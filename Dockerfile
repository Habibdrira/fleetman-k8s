FROM jenkins/jenkins:lts

USER root

RUN apt-get update &&     apt-get install -y apt-transport-https ca-certificates curl gnupg &&     curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&     echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list &&     apt-get update &&     apt-get install -y kubectl

USER jenkins

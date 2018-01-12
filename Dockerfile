FROM jenkins/jnlp-slave:3.15-1

USER root
RUN mkdir /workspace

RUN apt-get update -yq \
    && apt-get install -yq apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" \
    && apt-get update -yq \
    && apt-get install docker-ce -yq


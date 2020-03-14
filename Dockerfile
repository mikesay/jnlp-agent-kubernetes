FROM jenkins/jnlp-agent-docker:latest

ARG user=jenkins

USER root

RUN wget -nv -t 5 https://storage.googleapis.com/kubernetes-release/release/v1.15.5/bin/linux/amd64/kubectl -P /usr/local/bin/ && \
    chmod a+x /usr/local/bin/kubectl && \
    wget -nv -t 5 -Y off  https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz -P /tmp/ && \
    cd /tmp && tar -xvf /tmp/helm-v2.14.1-linux-amd64.tar.gz && \
    cp /tmp/linux-amd64/helm /usr/local/bin/ && \
    chmod a+x /usr/local/bin/helm && \
    rm -rf /tmp/linux-amd64 && rm -f /tmp/helm-v2.14.1-linux-amd64.tar.gz

USER ${user}
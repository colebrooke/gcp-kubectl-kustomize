FROM google/cloud-sdk:alpine

ENV KUBE_VERSION="v1.17.3"

RUN apk add --no-cache \
    ca-certificates \
    openssh \
    git \
    curl && \
    wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl \
         -O /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash && \
    mv kustomize /usr/local/bin/ 

VOLUME ["/root/.config"]

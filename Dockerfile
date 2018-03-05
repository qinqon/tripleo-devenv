FROM centos:7
RUN yum update -y && yum upgrade -y
RUN yum -y install \
  sudo \
  git \
  openssh-clients
RUN echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN git clone https://github.com/openstack/tripleo-quickstart \
    && cd tripleo-quickstart \
    && bash quickstart.sh --install-deps
WORKDIR tripleo-quickstart
COPY install-ssh-keys.sh .
CMD bash install-ssh-keys.sh /host/tmp/

FROM centos:7
RUN yum update -y && yum upgrade -y
RUN yum -y install \
  sudo \
  git \
  openssh-clients
RUN echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -ms /bin/bash stack
USER stack
WORKDIR /home/stack
CMD ["bash"]

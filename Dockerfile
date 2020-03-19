FROM alpine:3.8
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN apk --update add sudo
RUN apk --update add python py-pip openssl ca-certificates
RUN apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base
RUN pip install --upgrade pip cffi
RUN pip install ansible
RUN pip install --upgrade pycrypto pywinrm
RUN apk --update add sshpass openssh-client rsync
RUN mkdir -p /etc/ansible
RUN echo 'localhost' > /etc/ansible/hosts
CMD [ "ansible-playbook", "--version" ]
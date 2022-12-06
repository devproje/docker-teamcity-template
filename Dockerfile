FROM fedora:latest

ARG filename="TeamCity-2022.10.1.tar.gz"

WORKDIR /opt

# Java Installation
RUN sudo rpm --import https://yum.corretto.aws/corretto.key
RUN sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
RUN sudo dnf install -y java-11-amazon-corretto-devel

# TeamCity Installation
RUN wget https://download.jetbrains.com/teamcity/${filename}
RUN tar -C /opt -zxvf ./${filename}
RUN rm ${filename}

ENTRYPOINT [ "/opt/TeamCity/bin/teamcity-server.sh", "run" ]
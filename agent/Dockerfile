FROM fedora:latest

WORKDIR /opt/agent

ARG SERVER_URL
ENV SERVER_URL=${SERVER_URL}

# Add Java installation Key
RUN sudo rpm --import https://yum.corretto.aws/corretto.key
RUN sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

RUN sudo dnf install -y wget git docker docker-compose \
java-11-amazon-corretto-devel go rust nodejs \
npm zip unzip
RUN npm install -g yarn
RUN npm install -g pnpm

RUN wget https://ci.projecttl.net/update/buildAgent.zip
RUN unzip ./buildAgent.zip
RUN rm ./buildAgent.zip

COPY ./buildAgent.properties ./conf
COPY ./run.sh .

RUN chmod a+x ./run.sh

ENTRYPOINT [ "/opt/agent/run.sh" ]
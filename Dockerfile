FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y && apt-get install make
USER jenkins

 #COPY jenkins.yaml /var/jenkins_conf/

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

EXPOSE 8080
EXPOSE 50000
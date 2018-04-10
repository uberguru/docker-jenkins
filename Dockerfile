FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update && apt-get -y upgrade && apt-get install -y cowsay
# drop back to the regular jenkins user - good practice

#install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER jenkins

FROM qnib/alpn-jenkins

USER jenkins
RUN mkdir ~/.ssh \
 && cd ~/.ssh \
 && ssh-keygen -t rsa -C "qnibqnibqnib" -f /home/jenkins/.ssh/id_rsa \
 && cp /home/jenkins/.ssh/id_rsa.pub /home/jenkins/.ssh/authorized_keys \
 && cat /home/jenkins/.ssh/id_rsa
USER root

ADD opt/qnib/jenkins/master/bin/start.sh /opt/qnib/jenkins/master/bin/
ADD etc/supervisord.d/jenkins.ini /etc/supervisord.d/

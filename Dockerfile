FROM cern/slc6-base

RUN yum -y update

RUN yum -y localinstall http://service-hpglview.web.cern.ch/service-hpglview/download/hpglview-543-1.slc6.x86_64.rpm

RUN yum -y install sudo

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/slottad && \
    echo "slottad:x:${uid}:${gid}:Slottad,,,:/home/slottad:/bin/bash" >> /etc/passwd && \
    echo "slottad:x:${uid}:" >> /etc/group && \
    echo "slottad ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/slottad && \
    chmod 0440 /etc/sudoers.d/slottad && \
    chown ${uid}:${gid} -R /home/slottad

USER slottad
ENV HOME /home/slottad
#CMD /bin/bash
CMD /usr/bin/hpglview

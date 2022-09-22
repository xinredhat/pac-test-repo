FROM registry.access.redhat.com/ubi8/ubi-minimal:8.6
LABEL build-date= \
      com.redhat.build-host= \
      description="This image provides a script to trigger Gitlab CI from a Github action upon changes in the Pipeline Service repo." \
      distribution-scope="public" \
      io.k8s.description="This image provides a script to trigger Gitlab CI from a Github action upon changes in the Pipeline Service repo." \
      io.k8s.display-name="trigger gitlab ci" \
      maintainer="Pipeline Service" \
      name="trigger-gitlab-ci" \
      release="0.1" \
      summary="Provides a script to trigger Gitlab CI from a Github action upon changes in the Pipeline Service repo." \
      url="https://github.com/openshift-pipelines/pipeline-service/tree/main/test/images/vulnerability-scan" \
      vcs-ref=  \
      vcs-type="git" \
      vendor="Pipeline Service" \
      version="0.1"
WORKDIR /
RUN mkdir /workspace && chmod 777 /workspace && chown 65532:65532 /workspace
ENV HOME /tmp/home
RUN mkdir $HOME && chmod 777 $HOME && chown 65532:65532 $HOME
COPY ./run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh
USER 65532:65532
VOLUME /workspace
WORKDIR /workspace
ENTRYPOINT ["/usr/local/bin/run.sh"]
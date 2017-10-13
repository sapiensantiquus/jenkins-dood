if [[ -n "$PRODUCT" ]] && [[ ! -e $JENKINS_HOME/config.xml ]]
then
  aws --region $REGION s3 cp "s3://<some_bucket_name>/$PRODUCT/jenkins/jenkins_data.tgz" /tmp/restored.tgz &&\
  tar -xzf /tmp/restored.tgz -C /  &&\
  chown -R jenkins:jenkins $JENKINS_HOME &&\
  rm /tmp/restored.tgz || true
fi

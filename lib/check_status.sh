#!/bin/sh
cat "./ip.list" | while read line; do
  ip=$(echo $line | awk '{ print $1 }')
  instance_type=$(echo $line | awk '{ print $2 }')
  running_workflow=$(ssh -n -i "${HOME}/.ssh/crest-inutano.pem" ubuntu@"${ip}" "ps aux" | awk '/run-cwl/ { print $NF }')
  running_container=$(ssh -n -i "${HOME}/.ssh/crest-inutano.pem" ubuntu@"${ip}" "docker ps" | awk '!/(telegraf|fluentd|elk|CONTAINER)/')
  echo "${ip}\t${instance_type}\t${running_workflow}\t${running_container}"
done

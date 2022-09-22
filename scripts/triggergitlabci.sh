#!/usr/bin/env bash

#quit if exit status of any cmd is a non-zero value
set -exuo pipefail

# extract values from env variables
gitlab_token=$gitlab_token
ca_cert=$ca_cert

# decode the value of ca-cert and copy it to the path
decoded_ca_cert=$(echo "$ca_cert" | base64 -d)
echo "$decoded_ca_cert" > /tmp/decoded_ca_cert.crt
sudo cp /tmp/decoded_ca_cert.crt /etc/ssl/certs/ca-bundle.crt

for i in {1..3}
do
  res=$(curl -s -w '%{http_code}' -X POST --fail -F token="$gitlab_token" -F ref=main https://gitlab.cee.redhat.com/api/v4/projects/65094/trigger/pipeline)
  if [[ "$res" == 201 ]]; then
    exit 0
  fi
done

exit 1

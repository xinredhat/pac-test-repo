#!/usr/bin/env bash

#quit if exit status of any cmd is a non-zero value
set -exuo pipefail

# decode the value of ca-cert and copy it to the path
decoded_ca_cert=$(echo "$CA_CERT" | base64 -d)
echo "$decoded_ca_cert" > /tmp/decoded_ca_cert.crt
sudo cp /tmp/decoded_ca_cert.crt /etc/ssl/certs/ca-bundle.crt
sudo cat /etc/ssl/certs/ca-bundle.crt

for _ in {1..3}
do
  res=$(curl -s -w '%{http_code}' -X POST --fail -F token="$GITLAB_TOKEN" -F ref=main https://gitlab.cee.redhat.com/api/v4/projects/65094/trigger/pipeline)
  if [[ "$res" == 201 ]]; then
    exit 0
  fi
done

exit 1

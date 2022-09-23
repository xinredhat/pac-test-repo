#!/usr/bin/env bash

#quit if exit status of any cmd is a non-zero value
set -exuo pipefail

for _ in {1..3}
do
  res=$(curl -k -w '%{http_code}' -X POST --fail -F token="$GITLAB_TOKEN" -F ref=main https://gitlab.cee.redhat.com/api/v4/projects/65094/trigger/pipeline)
  if [[ "$res" == 201 ]]; then
    exit 0
  fi
done

exit 1

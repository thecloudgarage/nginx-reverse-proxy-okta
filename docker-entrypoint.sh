#!/usr/bin/env sh
set -eu

envsubst '${okta_url} ${okta_client_id} ${okta_client_secret}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec "$@"

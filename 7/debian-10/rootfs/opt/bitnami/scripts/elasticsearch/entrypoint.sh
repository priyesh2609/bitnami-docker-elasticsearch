#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

# Load libraries
. /opt/bitnami/scripts/libbitnami.sh
. /opt/bitnami/scripts/libelasticsearch.sh

# Load Elasticsearch environment variables
eval "$(elasticsearch_env)"

echo "Invoked entrypoint.sh"

print_welcome_page

info "Adding Elasticsearch to path"

export PATH="$PATH:/usr/share/elasticsearch/bin/"

if [[ "$*" = "/opt/bitnami/scripts/elasticsearch/run.sh" ]]; then
    info "** Starting Elasticsearch setup **"
    su root /opt/bitnami/scripts/elasticsearch/setup.sh
    info "** Elasticsearch setup finished! **"
fi

echo ""
exec "$@"

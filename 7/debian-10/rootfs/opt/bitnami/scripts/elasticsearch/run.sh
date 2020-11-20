#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

# Load libraries
. /opt/bitnami/scripts/libelasticsearch.sh
. /opt/bitnami/scripts/libos.sh

# Load Elasticsearch environment variables
eval "$(elasticsearch_env)"

debug "Invoked run.sh"

# Constants
EXEC=/usr/share/elasticsearch/bin/elasticsearch
ARGS=("-p" "$ELASTICSEARCH_TMP_DIR/elasticsearch.pid" "-Epath.data=$ELASTICSEARCH_DATA_DIR")
[[ -z "${ELASTICSEARCH_EXTRA_FLAGS:-}" ]] || ARGS=("${ARGS[@]}" "${ELASTICSEARCH_EXTRA_FLAGS[@]}")
export JAVA_HOME=/opt/bitnami/java

info "** Starting Elasticsearch **"
if am_i_root; then
    debug "Invoking es as root"
    exec gosu "$ELASTICSEARCH_DAEMON_USER" "$EXEC" "${ARGS[@]}"
else
    debug "Invoking es as a user"
    exec "$EXEC" "${ARGS[@]}"
fi

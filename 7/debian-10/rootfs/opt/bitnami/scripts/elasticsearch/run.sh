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

echo "--------------run.sh"


# Constants
# EXEC=$(command -v elasticsearch)
# debug "------------** Starting Elasticsearch **"
# ARGS=("-p" "$ELASTICSEARCH_TMP_DIR/elasticsearch.pid" "-Epath.data=$ELASTICSEARCH_DATA_DIR")
# [[ -z "${ELASTICSEARCH_EXTRA_FLAGS:-}" ]] || ARGS=("${ARGS[@]}" "${ELASTICSEARCH_EXTRA_FLAGS[@]}")
export JAVA_HOME=/opt/bitnami/java

# echo $ARGS

service elasticsearch start
# info "** Starting Elasticsearch **"
# if am_i_root; then
#     exec gosu "$ELASTICSEARCH_DAEMON_USER" "$EXEC" "${ARGS[@]}"
# else
#     exec "$EXEC" "${ARGS[@]}"
# fi

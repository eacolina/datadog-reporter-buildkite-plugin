#!/bin/bash

function reportToDatadog() {
  local metric_name=$1
  local metric_value=$2
  local metric_type=$3
  local tags=$4

  DD_HOST=${BUILDKITE_PLUGIN_DATADOG_STATS_DOGSTATSD_HOST:-"172.17.0.1"}
  DD_PORT=${BUILDKITE_PLUGIN_DATADOG_STATS_DOGSTATSD_PORT:-8125}

  echo "Reporting ${metric_name} with value=${metric_value}, type=${metric_type}, tags=${tags}"
  echo "Sending to ${DD_HOST}:${DD_PORT}..."
  echo -n "${metric_name}:${metric_value}|${metric_type}|#${tags}" > /dev/udp/"${DD_HOST}"/"${DD_PORT}"
}

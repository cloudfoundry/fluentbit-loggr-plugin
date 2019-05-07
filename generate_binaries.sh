#!/usr/bin/env bash

set -x

current_dir="$(cd "$( dirname "$0" )" && pwd)"
docker build . -t fluentbit-loggr-plugin
docker run -v ${current_dir}/bin:/tmp \
       fluentbit-loggr-plugin:latest \
       /bin/cp -- /fluent-bit/bin/fluent-bit /src/out_loggregator.so /tmp
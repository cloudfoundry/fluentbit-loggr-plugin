#!/usr/bin/env bash
set -x

plugin_dir=$(cd $(dirname ${BASH_SOURCE}) && pwd)
pushd ${plugin_dir}
    docker build . -t fluentbit-loggr-plugin
    docker run -v ${plugin_dir}/bin:/tmp \
        fluentbit-loggr-plugin:latest \
        /bin/cp -- /fluent-bit/bin/fluent-bit /src/out_loggregator.so /tmp
popd
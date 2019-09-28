#!/bin/bash
# Copyright (c) 2019 Intel Corporation
#
# SPDX-License-Identifier: Apache-2.0
#
set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

kubectl create -f workloads.yaml

if ! kubectl wait pod -l app="overhead" --for=condition=Ready --timeout "200s"; then
	echo "Timeout to get pods in ready"
fi

echo "pods are running"
echo

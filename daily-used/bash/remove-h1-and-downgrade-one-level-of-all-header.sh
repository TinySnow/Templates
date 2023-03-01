#!/usr/bin/env bash

set -Eeuxo pipefail


if [[ $1 ]]; then
	sed -i -e '/^#\ /d' $1
	sed -i -e 's/^#//' $1
fi
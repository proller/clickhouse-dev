#!/bin/bash -e

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
${pwd}/build.sh
${pwd}/server.sh $*

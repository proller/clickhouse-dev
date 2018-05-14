#!/usr/bin/env bash

UPDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)
CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd ${CURDIR}/..

git remote add upstream https://github.com/yandex/ClickHouse.git
git pull && git merge --no-edit upstream/master && git push

cd ${CURDIR}

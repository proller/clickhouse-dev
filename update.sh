#!/usr/bin/env bash

#UPDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)
CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd ${CURDIR}
git pull --rebase

cd ${CURDIR}/..

git remote add upstream https://github.com/yandex/ClickHouse.git
git fetch --all
git pull --rebase
git pull && git merge --no-edit upstream/master && git push && git submodule update --init --recursive
git diff upstream/master

cd ${CURDIR}

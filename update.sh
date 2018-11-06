#!/usr/bin/env bash

#UPDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd ${CUR_DIR}
git pull --rebase

cd ${CUR_DIR}/..

git remote add upstream https://github.com/yandex/ClickHouse.git
git fetch --all
git pull --rebase
git pull && git merge --no-edit upstream/master && git push && git submodule update --init --recursive
git describe
git status
git diff upstream/master

cd ${CUR_DIR}

#!/bin/bash
set -ex
cp ../requirements-dev.txt .
docker build -t amoffat/shtest $@ .
rm requirements-dev.txt

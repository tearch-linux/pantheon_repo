#!/usr/bin/env bash

cd "$(dirname "$0")"

repo-add pantheon_repo.db.tar.gz *.pkg.tar.xz
repo-add pantheon_repo.db.tar.gz *.pkg.tar.zst

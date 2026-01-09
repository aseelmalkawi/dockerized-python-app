#!/bin/bash

VERSION=$(poetry version -s)
echo "VERSION=$VERSION" >> $GITHUB_ENV
echo "version: \"$VERSION\"" > version.yaml
ls -l
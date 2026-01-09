#!/bin/bash

VERSION=$(cat version.yaml)
echo "VERSION=$VERSION" >> $GITHUB_ENV

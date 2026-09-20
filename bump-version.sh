#!/bin/sh
# Bump the build version so installed web apps notice the new deploy.
# Writes the same stamp into version.json and the <meta name="app-version"> tag.
set -e
cd "$(dirname "$0")"
V=$(date -u +%Y%m%d.%H%M)
printf '{\n  "version": "%s"\n}\n' "$V" > version.json
perl -pi -e 's/(<meta name="app-version" content=")[^"]*(">)/${1}'"$V"'${2}/' index.html
echo "$V"

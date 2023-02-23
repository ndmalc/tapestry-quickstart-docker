#/bin/bash

set -x

sed -E 's/(<tapestry-release-version>)5.2.1-SNAPSHOT(<\/tapestry-release-version>)/\15.2.1\2/' pom.xml > pom.xml.tmp
mv -f pom.xml.tmp pom.xml
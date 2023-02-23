#/bin/bash

set -x

sed -E 's/(<tapestry-release-version>)5.0.19-SNAPSHOT(<\/tapestry-release-version>)/\15.0.19\2/' pom.xml > pom.xml.tmp
mv -f pom.xml.tmp pom.xml


cat pom.xml | tr '\n' '%' | sed -E 's/.*(<project[^>]*>).*/\1/' | sed -E 's/\//\\\//g' > pom.xml.back
cat pom.xml | tr '\n' '%' | sed -E 's/<project[^>]*>/<project>/' | tr '%' '\n' | \
xmlstarlet tr /app/patch/patch_pom_1_5.0.19.xsl | \
tr '\n' '%' | sed -E "s/<project>/$(cat pom.xml.back)/" | tr '%' '\n' > pom.xml
rm -f pom.xml.back
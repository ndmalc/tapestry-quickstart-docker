#/bin/bash

set -x

cat pom.xml | tr '\n' '%' | sed -E 's/.*(<project[^>]*>).*/\1/' | sed -E 's/\//\\\//g' > pom.xml.back
cat pom.xml | tr '\n' '%' | sed -E 's/<project[^>]*>/<project>/' | tr '%' '\n' | \
xmlstarlet tr /app/patch/patch_pom_1_5.0.16.xsl | \
tr '\n' '%' | sed -E "s/<project>/$(cat pom.xml.back)/" | tr '%' '\n' > pom.xml
rm -f pom.xml.back
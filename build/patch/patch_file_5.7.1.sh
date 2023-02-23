#/bin/bash

set -x

cd src/main/java/com/example/newapp/services/

sed -E 's/org.apache.tapestry5.services/org.apache.tapestry5.http.services/' AppModule.java > AppModule.java.tmp
mv -f AppModule.java.tmp AppModule.java
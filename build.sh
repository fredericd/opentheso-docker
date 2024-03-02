#! /bin/bash

source .env

echo "Build two Docker local images of Opentheso $OPENTHESO_VERSION"

ROOT_DIR=`pwd`

cd dists/tomcat
rm ROOT.war
rm -rf ROOT
mkdir ROOT
wget -nv https://github.com/miledrousset/Opentheso2/releases/download/v$OPENTHESO_VERSION//opentheso2-$OPENTHESO_VERSION.war -O ROOT/ROOT.war
cd ROOT
unzip -qq ROOT.war
rm ROOT.war

cp ../hibernate.cfg.xml WEB-INF/classes/
cp ../hikari.properties WEB-INF/classes/

zip -r -qq ../ROOT.war *
cd ..
rm -rf ROOT

IMAGE_NAME="opentheso/tomcat:$OPENTHESO_VERSION"
echo "(1) Build image $IMAGE_NAME"
docker build -t $IMAGE_NAME .
rm ROOT.war

IMAGE_NAME="opentheso/postgres"
echo "(2) Build image $IMAGE_NAME"
cd $ROOT_DIR/dists/postgres
docker build -t $IMAGE_NAME .


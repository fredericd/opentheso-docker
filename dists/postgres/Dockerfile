FROM postgres:alpine
MAINTAINER "f.demians@tamil.fr"

ENV OPENTHESO_VERSION=24.02.03

# Copy in the Opentheso database setup scripts
ADD https://raw.githubusercontent.com/miledrousset/Opentheso2/v$OPENTHESO_VERSION/src/main/resources/install/opentheso_current.sql /docker-entrypoint-initdb.d/01-opentheso_current.sql
ADD https://raw.githubusercontent.com/miledrousset/Opentheso2/v$OPENTHESO_VERSION/src/main/resources/install/maj_bdd_current2.sql /docker-entrypoint-initdb.d/02-maj_bdd_current2.sql

RUN chmod 744 /docker-entrypoint-initdb.d/01-opentheso_current.sql \
    && chmod 744 /docker-entrypoint-initdb.d/02-maj_bdd_current2.sql


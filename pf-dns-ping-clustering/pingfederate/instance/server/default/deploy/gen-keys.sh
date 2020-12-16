#!/bin/bash

PF_BIN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PF_HOME=${PF_BIN%/server/default/deploy}
PF_DEPLOY=${PF_HOME}/server/default/deploy
PF_LIB=${PF_HOME}/server/default/lib

JARFILE=`find ${PF_DEPLOY} -name "pf-remember-last-user-adapter-*.jar"`
JARFILE=${JARFILE##*/}

ADAPTER=${PF_DEPLOY}/${JARFILE}
JOSE4J=${PF_LIB}/jose4j.jar
COMMONS_LANG=${PF_LIB}/commons-lang.jar
COMMONS_LOGGING=${PF_LIB}/commons-logging.jar
LOG4J=${PF_LIB}/log4j-api.jar:${PF_LIB}/log4j-core.jar
SLF4J=${PF_LIB}/slf4j-api.jar:${PF_LIB}/log4j-slf4j-impl.jar

CLASSPATH=${ADAPTER}:${JOSE4J}:${COMMONS_LANG}:${COMMONS_LOGGING}:${LOG4J}:${SLF4J}
TOKEN_HELPER=com.pingidentity.ps.pf.adapter.idp.FingerprintToken

java -cp ${CLASSPATH} ${TOKEN_HELPER}

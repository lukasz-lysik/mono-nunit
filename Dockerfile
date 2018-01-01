FROM mono:latest

ENV NUNIT_VERSION 3.5.0

RUN \
    apt-get update && \
    apt-get install -y && \
    apt-get install -y wget && \
    nuget install NUnit.ConsoleRunner -o /tmp/nunit -version $NUNIT_VERSION && \
    cp -r /tmp/nunit/NUnit.ConsoleRunner.$NUNIT_VERSION/tools/ /nunit/

RUN echo '#!/bin/bash\nmono /nunit/nunit3-console.exe "$@"' > /usr/bin/nunit && \
    chmod +x /usr/bin/nunit

RUN apt-get clean

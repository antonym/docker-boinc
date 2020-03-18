FROM ubuntu:20.04
MAINTAINER Antony Messerli <amesserl@rackspace.com>

# Install BOINC
RUN apt-get update && apt-get install -y boinc-client

# Set working directory
WORKDIR /var/lib/boinc-client

# Run BOINC by default. Expects env vars for url and account key
CMD /etc/init.d/boinc-client start; sleep 5; /usr/bin/boinccmd --project_attach ${boincurl} ${boinckey}; tail -f /var/lib/boinc-client/std*.txt

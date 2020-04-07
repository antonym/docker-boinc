FROM ubuntu:19.10
MAINTAINER Antony Messerli <amesserl@rackspace.com>

# Install BOINC
RUN apt-get update && apt-get install -y boinc-client

# Set working directory
WORKDIR /var/lib/boinc-client

# Copy override prefs so we don't run out of space in our image
COPY global_prefs_override.xml /etc/boinc-client/global_prefs_override.xml

# Run BOINC by default. Expects env vars for url and account key
CMD /etc/init.d/boinc-client start; sleep 5; /usr/bin/boinccmd --project_attach ${boincurl} ${boinckey}; tail -f /var/lib/boinc-client/std*.txt

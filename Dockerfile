# argument can be passed on the command line with build-arg
# for example --build-arg=ORIGINAL_IMAGE=apachepulsar/pulsar:2.8.1
ARG ORIGINAL_IMAGE

# original docker image
FROM ${ORIGINAL_IMAGE}

# add environment based workaround to disable vulnerable feature in Log4J 2.10.0+
# see https://twitter.com/brunoborges/status/1469462412679991300 about LOG4J_FORMAT_MSG_NO_LOOKUPS=true
ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true

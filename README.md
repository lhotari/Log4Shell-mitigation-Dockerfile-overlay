# Patch existing docker images with ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true workaround for Log4Shell

see the [Dockerfile](Dockerfile)

Add environment based workaround to disable vulnerable feature in Log4J 2.10.0+.
See https://twitter.com/brunoborges/status/1469462412679991300 about `LOG4J_FORMAT_MSG_NO_LOOKUPS=true`.

## Building and pushing patched docker images

example usage:
```
# build and tag image
docker build --build-arg=ORIGINAL_IMAGE=apachepulsar/pulsar:2.8.1 . -t myrepo/pulsar:2.8.1-log4j-patched
# verify that the environment contains LOG4J_FORMAT_MSG_NO_LOOKUPS=true (if your container contains sh)
docker run --rm -it myrepo/pulsar:2.8.1-log4j-patched sh -c printenv | grep LOG4J
# push image
docker push myrepo/pulsar:2.8.1-log4j-patched
```

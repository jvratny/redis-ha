# This file serves for extending the container image, typically by changing
# the configuration, loading some data etc.

# Feel free to add content to this file or rewrite it at all.
# You may also start redis server locally to load some data for example,
# but do not forget to stop it after it, so it can be restarted after it.
eval echo "cluster-announce-ip \$$REDIS_INSTANCE""_SERVICE_HOST" >> /etc/redis.conf


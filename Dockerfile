FROM registry.redhat.com/rhscl/redis-5-rhel7:latest

COPY redis.conf /etc/redis.conf

CMD [ "run-redis" ]

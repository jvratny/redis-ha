FROM registry.redhat.io/rhscl/redis-5-rhel7:latest

COPY redis.conf /etc/redis.conf

USER root

RUN chmod 550 /etc/redis.conf
RUN chown redis /etc/redis.conf

#USER 1001

CMD [ "run-redis" ]

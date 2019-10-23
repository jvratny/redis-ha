FROM registry.redhat.io/rhscl/redis-5-rhel7:latest

COPY redis.conf /etc/redis.conf
COPY password.conf.template /usr/share/container-scripts/redis/password.conf.template

USER root
RUN chown redis /etc/redis.conf
RUN chmod 660 /etc/redis.conf
USER 1001

CMD [ "run-redis" ]

FROM nginx:alpine

ENV UID=${UID:-9999}
ENV GID=${GID:-9999}
ENV USER_NAME=${USER_NAME}
ENV GROUP_NAME=${GROUP_NAME}
ENV USER_GECOS=${USER_GECOS}

RUN set -x;\
    mkdir -p /var/www/html /var/www/default /var/run/nginx; \
    apk --update upgrade --no-cache -q; \
    apk add --no-cache -q bash; \
    addgroup --gid ${GID} ${GROUP_NAME}; \
    addgroup root ${GROUP_NAME}; \
    adduser --uid ${UID} -D -g "${USER_GECOS}" ${USER_NAME} -s /bin/bash -G ${GROUP_NAME}; \
    chown -R ${USER_NAME}.${GROUP_NAME} /var/www/; \
    chown -R ${USER_NAME}.${GROUP_NAME} /var/cache/nginx; \
    chown ${USER_NAME}.${GROUP_NAME} /var/run/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./error.html /var/www/default/error.html

CMD ["nginx", "-g", "daemon off;"]
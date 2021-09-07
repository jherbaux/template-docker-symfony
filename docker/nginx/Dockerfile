ARG NGINX_VERSION

FROM nginx:${NGINX_VERSION}

RUN apt-get update && apt-get install -y --no-install-recommends \
        wget=1.* \
        vim=2* \
        ghostscript=9.* \
        imagemagick=8* \
        git=1* \
        openssl=* \
    && rm -rf /var/lib/apt/lists/*

COPY docker/nginx/config/vhost.conf /etc/nginx/conf.d/default.conf

RUN echo 'alias sc="symfony console"' >> ~/.bashrc
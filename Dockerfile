FROM quay.io/sporkmonger/confd:latest
MAINTAINER Bob Aman <bob@sporkmonger.com>

# Install Nginx & static asset build tools
RUN apk add --update nginx make curl pngcrush nodejs python g++ && \
  rm -rf /var/cache/apk/* && \
  npm install -g coffee-script uglify-js node-sass uglifycss bower

# Add confd files
COPY ./nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl
COPY ./nginx.toml /etc/confd/conf.d/nginx.toml

# Wire up directories
RUN mkdir -p /opt/src && mkdir -p /tmp/nginx && mkdir -p /var/log/nginx

# Remove default site
RUN rm -f /etc/nginx/sites-enabled/default

# Save time by causing this to fail if broken
RUN /usr/sbin/nginx -t -c /etc/nginx/nginx.conf

# Build assets
COPY ./assets /opt/src
RUN mkdir -p /srv/www/js /srv/www/css /srv/www/images && \
  cd /opt/src && make && make install && make clean && cd -

# Add boot script
COPY ./start /opt/bin/start
RUN chmod a+x /opt/bin/confd && chmod a+x /opt/bin/start

EXPOSE 80 443

# Run the boot script
CMD /opt/bin/start

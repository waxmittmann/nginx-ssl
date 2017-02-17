FROM nginx
RUN echo 'Beginning build'

# Expose ports
EXPOSE 80 443

# Copy certs and config
COPY localhost.crt /etc/nginx/
COPY localhost.key /etc/nginx/
COPY prod.conf /etc/nginx/conf.d/
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old

# Mount volume
VOLUME /usr/share/nginx/html:ro
# VOLUME /testContent

RUN echo 'Build complete'

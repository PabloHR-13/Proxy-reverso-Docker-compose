FROM nginx
RUN openssl && \
    openssl req -x509 -nodes -days 365 \
     -subj "/C=ES/ST=ES/O=ES/CN=ES" \
       -newkey rsa:2048 -keyout /etc/ssl/private/server.key \
       -out /etc/ssl/private/server.crt;
COPY nginx.conf /etc/nginx/conf.d/default.conf

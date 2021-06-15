From nginx:latest

RUN apt-get update -y
RUN apt-get upgrade -y


RUN apt-get install build-essential daemon apt-utils git wget libxml2-dev libxslt1-dev libgd-dev libgeoip-dev make libpcre3-dev libssl-dev unzip -y

RUN wget wget http://nginx.org/download/nginx-1.16.1.tar.gz \
&& tar zxvf nginx-1.16.1.tar.gz \
&& cd nginx-1.16.1 

RUN wget https://github.com/nbs-system/naxsi/archive/master.zip \
&& unzip master.zip

RUN cd nginx-1.16.1/ \
&& ./configure --conf-path=/etc/nginx/nginx.conf --add-module=../naxsi-master/naxsi_src/ --error-log-path=/var/log/nginx/error.log --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-log-path=/var/log/nginx/access.log --http-proxy-temp-path=/var/lib/nginx/proxy --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --user=www-data --group=www-data --with-http_ssl_module --without-mail_pop3_module --without-mail_smtp_module --without-mail_imap_module --without-http_uwsgi_module --without-http_scgi_module --prefix=/usr \

&& make \
&& make install 

RUN mkdir /var/lib/nginx/body
RUN mkdir /var/lib/nginx/fastcgi

RUN cp naxsi_core.rules /etc/nginx
RUN cp naxsi.rules /etc/nginx
RUN cp nginx.conf /etc/nginx
RUN cp nginx.service /lib/systemd/system

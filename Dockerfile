FROM httpd:2.4-alpine3.18


VOLUME [ "/data" ]

RUN apk add subversion mod_dav_svn
RUN mkdir -p /data/svn_repos
# RUN svnadmin create /data/svn_repos/nselab

COPY ./dav_svn.conf /usr/local/apache2/conf/extra/dav_svn.conf
RUN echo "Include conf/extra/dav_svn.conf" >> /usr/local/apache2/conf/httpd.conf

COPY ./create-repo.sh /bin/create-repo.sh
RUN chmod +x /bin/create-repo.sh


EXPOSE 80

FROM centos

RUN yum -y install openssl vsftpd && rm -rf /var/cache/yum/*

RUN openssl req -x509 -nodes -days 7300\
            -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem\
            -subj "/C=FR/O=My company/CN=example.org"

COPY vsftp.conf /etc/vsftp/vsftp.conf
COPY vsftp_ftps.conf /etc/vsftp/vsftp_ftps.conf
COPY vsftp_ftps_tls.conf /etc/vsftp/vsftp_ftps_tls.conf
COPY start.sh /

RUN chmod 755 /start.sh

EXPOSE 21

ENTRYPOINT ["/start.sh"]
FROM rockylinux:9

RUN dnf install -y httpd && \
    dnf clean all

COPY index.html /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
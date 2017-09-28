FROM python:2.7-alpine
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

COPY enterpoint.sh /root/enterpoint.sh

RUN apk add --update git py-mysqldb mysql-dev gcc musl-dev && \
    apk add qt5-qtbase-dev \
            wkhtmltopdf \
            --no-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted && \
    pip --no-cache-dir install django && \
    pip --no-cache-dir install django-crontab && \
    pip --no-cache-dir install openpyxl && \
    pip --no-cache-dir install xlsxwriter && \
    pip --no-cache-dir install MySQL-python && \
    pip --no-cache-dir install xlrd && \
    pip --no-cache-dir install pdfkit && \
    pip --no-cache-dir install pandas && \
    pip --no-cache-dir install pillow && \
    pip --no-cache-dir install matplotlib && \
    pip --no-cache-dir install requests && \
    pip --no-cache-dir install qrcode && \
    chmod +x /root/enterpoint.sh && \
    apk del gcc musl-dev mysql-dev && \
    rm -rf /var/cache/apk/*


EXPOSE 80

ENTRYPOINT ["/root/enterpoint.sh"]

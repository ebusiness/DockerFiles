FROM python:2.7-alpine
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

COPY enterpoint.sh /root/enterpoint.sh

RUN apk add --update git py-mysqldb mysql-dev gcc musl-dev
RUN apk add --no-cache --virtual .build-deps \
        build-base \
        g++ \
        python-dev \
        libpng-dev \
        freetype-dev \
        zlib \
        jpeg
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN apk add --no-cache xvfb ttf-freefont fontconfig dbus
RUN apk add qt5-qtbase-dev \
            wkhtmltopdf \
            --no-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted
RUN pip --no-cache-dir install django==1.11.4 && \
    pip --no-cache-dir install crontab && \
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
    pip --no-cache-dir install pyminizip && \
    chmod +x /root/enterpoint.sh && \
    apk del gcc musl-dev mysql-dev .build-deps && \
    rm -rf /var/cache/apk/*
# matplotlibの$DISPLAYが未定義エラー対策（未検証）
RUN cp /usr/local/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc ~/.config/matplotlib/ && \
    sed 's/backend\s*:\s*[TKAGGtkagg]{5}/backend      : Agg' ~/.config/matplotlib/matplotlibrc
# matplotlibの日本語対応（未検証）



EXPOSE 80

ENTRYPOINT ["/root/enterpoint.sh"]

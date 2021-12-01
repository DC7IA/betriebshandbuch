FROM python:slim

#WORKDIR /docs

# Install dependencies
RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      graphviz \
      imagemagick \
      make \
      apache2 \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir -U pip
RUN python3 -m pip install --no-cache-dir Sphinx==4.1.2 Pillow

# Install additional Sphinx packages/extensions
RUN python3 -m pip install sphinx-rtd-theme myst-parser rinohtype

# Copy documentation source files
COPY docs /tmp/docs

# Build new documentation and link to Webserver root directory
RUN cd /tmp/docs \
    && make clean \
    && make html \
    && rm -rf /var/www/html \
    && ln -s /tmp/docs/build/html/ /var/www/html

CMD apachectl -D FOREGROUND

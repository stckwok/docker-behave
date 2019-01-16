# Docker image for behave and other Python-based BDD tools.
#
# URL: https://github.com/stckwok/docker-behave
#
# References: 
#   - https://eshlox.net/2016/11/22/dockerize-behave-selenium-tests/
#   - https://gist.github.com/ziadoz/3e8ab7e944d02fe872c3454d17af31a5
#
# For CJK font: https://github.com/elgalu/docker-selenium/pull/153
#
#
# Version     1.2.1
#


# pull base image
FROM python:3.6-slim-stretch

MAINTAINER Sam Kwok <stckwok@hotmail.com>

RUN \
    echo "==> Install common packages missing from the slim base image..."   && \
    apt-get update            && \
    apt-get install -y --no-install-recommends \
        gnupg   \
        dirmngr \
        wget    \
        ca-certificates               && \
        rm -rf /var/lib/apt/lists/*   && \
    \
    \
    echo "==> Install prerequisite packages..."   && \
    apt-get update            && \
    apt-get install -y --no-install-recommends \
        python3-dev              \
        python3-pip              \
        xvfb                     \
        libfontconfig            \
        libfreetype6             \
        xfonts-scalable          \
        fonts-liberation         \
        fonts-noto-cjk       &&  \
    \
    \
    echo "==> Install useful Python packages..."   && \
    pip3 install --no-cache-dir \
        requests                \
        unittest-xml-reporting  \
        nose                    \
        mockito                 \
        pyshould                \
                                && \
    \
    \
    echo "==> Install behave and related packages..."   && \
    pip3 install --no-cache-dir \
        behave                  \
        selenium                \
        elementium              \
        capybara-py             \
        xvfbwrapper             && \
    \
    \
    echo "==> Clean up..."      && \
    rm -rf /var/lib/apt/lists/*


WORKDIR    /behave
ENV        REQUIREMENTS_PATH  /behave/features/steps/requirements.txt

COPY       wrapper.sh  /tmp
ENTRYPOINT ["/tmp/wrapper.sh"]

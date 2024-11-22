FROM openjdk:8-jdk

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    gnupg2 \
    wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 && \
    add-apt-repository -y "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" && \
    apt-get update && \
    apt-get install -y --no-install-recommends elasticsearch

RUN getent group elasticsearch || groupadd -g 1000 elasticsearch && \
    id -u elasticsearch || useradd elasticsearch -u 1000 -g 1000

WORKDIR /usr/share/elasticsearch
RUN set -ex && for path in data logs config config/scripts; do \
        mkdir -p "$path"; \
        chown -R elasticsearch:elasticsearch "$path"; \
    done

COPY logging.yaml /usr/share/elasticsearch/config/
COPY elasticsearch.yaml /usr/share/elasticsearch/config/

USER elasticsearch
ENV PATH=$PATH:/usr/share/elasticsearch/bin

EXPOSE 9200 9300

CMD ["elasticsearch"]

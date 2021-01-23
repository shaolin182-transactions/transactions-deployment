FROM docker.elastic.co/kibana/kibana:7.8.1
ENV PATH /usr/share/kibana/bin:$PATH

RUN kibana-plugin install "https://github.com/fbaligand/kibana-enhanced-table/releases/download/v1.11.0/enhanced-table-1.11.0_7.8.1.zip"

USER kibana
EXPOSE 5601
CMD ["/usr/local/bin/kibana-docker"]
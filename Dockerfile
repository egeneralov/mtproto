FROM scratch
ADD mtproto-proxy.tar.gz .
ENTRYPOINT ["/bin/mtproto-proxy"]
CMD

# mtproto

Minimal container (8 mb) with mtproto in one layer. Manual compile, build and test.

## Build

    docker build . --tag egeneralov/mtproto

## Prepare to run

    apt-get install -yq xxd curl
    mkdir -p /opt/mtproto
    cd /opt/mtproto
    curl -s https://core.telegram.org/getProxySecret -o proxy-secret
    curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
    head -c 16 /dev/urandom | xxd -ps | tee user.passwd

## Run

    docker run -it --rm \
    -p 4433:4433 -p 8888:8888 \
    -u 110 \
    -v ${PWD}/proxy-multi.conf:/proxy-multi.conf \
    -v ${PWD}/proxy-secret:/proxy-secret \
    egeneralov/mtproto \
    -p 8888 -H 4433 -S $(cat user.passwd) --aes-pwd /proxy-secret /proxy-multi.conf -u 110


## Chroot deploy

Run prepare steps, please.

    curl -sL https://github.com/egeneralov/mtproto/raw/master/mtproto-proxy.tar.gz | tar xzvf -
    /opt/mtproto/bin/mtproto-proxy -p 8888 -H 4433 -S $(cat /opt/mtproto/user.passwd) --aes-pwd /opt/mtproto/proxy-secret /opt/mtproto/proxy-multi.conf -u root







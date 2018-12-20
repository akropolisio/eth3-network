FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum && \
  apt-get update && \
  apt-get install -y ethereum

WORKDIR /data

COPY ./genesis.json ./

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["geth", "--datadir", "/data/eth", "--rpc", "--networkid", "2020", "--mine"]

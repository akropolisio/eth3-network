FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum && \
  apt-get update && \
  apt-get install -y ethereum

WORKDIR /data

COPY ./genesis.json ./

EXPOSE 8545
EXPOSE 30303

CMD ["geth", "--debug", "--rpcapi", "eth,web3", "--rpcvhosts", "*", "--datadir", "/data/eth", "--rpcport", "8545", "--networkid", "2020", "--mine", "--minerthreads", "2", "--rpc", "--rpcaddr", "0.0.0.0"]

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common curl
RUN curl https://releases.parity.io/ethereum/v2.2.5/x86_64-unknown-linux-gnu/parity --output parity \
  && chmod +x parity \
  && mv ./parity /usr/bin/ \
  && parity -v

WORKDIR /data

COPY ./chain-spec.json ./
COPY ./node.toml ./

EXPOSE 8540
EXPOSE 30300

CMD ["parity", "--config", "./node.toml"]

# CMD ["geth", "--debug", "--rpcapi", "eth,web3", "--rpcvhosts", "*", "--datadir", "/data/eth", "--rpcport", "8545", "--networkid", "2020", "--mine", "--minerthreads", "2", "--rpc", "--rpcaddr", "0.0.0.0"]

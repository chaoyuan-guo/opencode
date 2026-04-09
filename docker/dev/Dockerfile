FROM oven/bun:1.3.11

SHELL ["/bin/bash", "-lc"]

RUN apt-get -o Acquire::Retries=5 update \
  && apt-get install -y --fix-missing --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    node-gyp \
    openssh-client \
    pkg-config \
    python3 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

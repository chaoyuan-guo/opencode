FROM oven/bun:1.3.11

SHELL ["/bin/bash", "-lc"]

RUN printf 'deb http://mirrors.aliyun.com/debian trixie main contrib non-free non-free-firmware\ndeb http://mirrors.aliyun.com/debian trixie-updates main contrib non-free non-free-firmware\n' > /etc/apt/sources.list \
  && rm -f /etc/apt/sources.list.d/debian.sources \
  && apt-get -o Acquire::Retries=5 update \
  && apt-get install -y --fix-missing --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssh-client \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

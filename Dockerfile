FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y \
  git \
  nano \
  build-essential \
  fonts-noto-cjk \
  python3

RUN git clone https://github.com/Zokhoi/LilyWhiteBot.git /home/node/lwb

WORKDIR "/home/node/lwb"
RUN npm install

RUN apt purge -y build-essential python3 && \
  apt autoremove -y && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

# HTTP POST server
EXPOSE 3000

CMD ["/bin/bash", "-c", "/home/node/lwb/main"]

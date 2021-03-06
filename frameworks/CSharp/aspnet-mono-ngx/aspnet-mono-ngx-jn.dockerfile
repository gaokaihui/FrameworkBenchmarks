FROM mono:latest
RUN apt update -yqq && apt install -yqq nginx wget mono-fastcgi-server

WORKDIR /aspnet
COPY src src
COPY nginx.conf nginx.conf
COPY run.sh run.sh

RUN msbuild src/Benchmarks.build.proj /t:Clean
RUN msbuild src/Benchmarks.build.proj /t:Build

CMD bash run.sh

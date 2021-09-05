FROM ubuntu:focal-20210827

RUN apt-get update
RUN apt-get install -y --no-install-recommends clang-tidy-12

COPY . /repro

ENTRYPOINT /repro/run_tidy.sh

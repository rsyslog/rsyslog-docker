printf "use ./build.sh --no-cache to disable cache\n"
docker build $1 -t rsyslog-container:ubuntu-20.04 .

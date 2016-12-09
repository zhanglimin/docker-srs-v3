#Build docker image
###
   ./Buildit
#Startup docker image
###
   ./startup -s server -p 1935:1940
   or
   ./startup -s server -p 1935 -a 1985 -c conf/default.conf
   Options:
      -s       docker container name prefix
      -p       rtmp port or range(start_port:end_port) default:1935
      -a       http api port or range(start_port:end_port) default:1985
      -c       srs config file default:conf/default.conf
#Stop docker image
###
   ./shutdown -s server -p 1935:1940 -r
    Options:
      -s       docker container name prefix
      -p       rtmp port or range(start_port:end_port) default:1935
      -a       http api port or range(start_port:end_port) default:1985
      -r       delete SERVER_PERFIX_[?] directory

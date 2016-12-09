#Build docker image
###
   ./Buildit
#Startup docker image
###
   ./startup -s server -p 1935:1940<br>
   or<br>
   ./startup -s server -p 1935 -a 1985 -c conf/default.conf<br>
   <br>
   Options:<br>
      -s       docker container name prefix<br>
      -p       rtmp port or range(start_port:end_port) default:1935<br>
      -a       http api port or range(start_port:end_port) default:1985<br>
      -c       srs config file default:conf/default.conf<br>
#Stop docker image
###
   ./shutdown -s server -p 1935:1940 -r<br>
   <br>
   Options:<br>
      -s       docker container name prefix<br>
      -p       rtmp port or range(start_port:end_port) default:1935<br>
      -a       http api port or range(start_port:end_port) default:1985<br>
      -r       delete SERVER_PERFIX_[?] directory<br>

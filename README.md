#Build docker image
###
   ./Buildit debian<br>
   or<br>
   ./Buildit raspbian
#Pull docker image
###
   sudo docker pull aesirteam/docker-srs:v1
#Startup docker container
###
   ./startup -s server -p 1935:1940<br>
   or<br>
   ./startup -t raspbian -s server -p 1935 -a 1985 -c conf/default.conf<br>
   <br>
   Options:<br>
      -t       docker image tag
      -s       docker container name prefix<br>
      -p       rtmp port or range(start_port:end_port) default:1935<br>
      -a       http api port or range(start_port:end_port) default:1985<br>
      -c       srs config file default:conf/default.conf<br>
#Stop docker container
###
   ./shutdown -s server
   or<br>
   ./shutdown -t raspbian -s server -p 1935:1940 -r<br>
   <br>
   Options:<br>
      -t       docker image tag
      -s       docker container name prefix<br>
      -p       rtmp port or range(start_port:end_port) default:1935<br>
      -a       http api port or range(start_port:end_port) default:1985<br>
      -r       delete SERVER_PERFIX_[?] directory<br>

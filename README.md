#Build docker image
###
   ./Buildit debian<br>
   or<br>
   ./Buildit raspbian
#Pull docker image
###
   sudo docker pull <a href="https://hub.docker.com/r/aesirteam/docker-srs-v3">aesirteam/docker-srs-v3</a><br>
   or<br>
   sudo docker pull <a href="https://hub.docker.com/r/aesirteam/docker-srs-v3">aesirteam/docker-srs-v3:raspbian</a>
#Startup docker container
###
   ./startup -s <i>server</i> -p <i>1935:1940</i><br>
   or<br>
   ./startup -t <i>raspbian</i> -s <i>server</i> -p <i>1935</i> -a <i>1985</i> -c <i>conf/default.conf</i><br>
   <br>
   Options:<br>
      -t       docker image tag<br>
      -s       docker container name prefix<br>
      -p       rtmp port or range(start_port:end_port) default:1935<br>
      -a       http api port or range(start_port:end_port) default:1985<br>
      -c       srs config file default:conf/default.conf<br>
#Stop docker container
###
   ./shutdown -s <i>server</i>
   or<br>
   ./shutdown -t <i>raspbian</i> -s <i>server</i> -p <i>1935:1940</i> -r<br>
   <br>
   Options:<br>
      -t       docker image tag<br>
      -s       docker container name prefix<br>
      -p       rtmp port or range(start_port:end_port) default:1935<br>
      -a       http api port or range(start_port:end_port) default:1985<br>
      -r       delete SERVER_PERFIX_[?] directory<br>

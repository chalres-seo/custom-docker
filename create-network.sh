docker network create --driver=bridge --subnet=172.21.0.1/16 --gateway=172.21.0.1 prod-net
docker network create --driver=bridge --subnet=172.20.0.1/16 --gateway=172.20.0.1 test-net

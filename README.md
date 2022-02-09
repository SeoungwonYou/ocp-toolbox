### build

```
# build
docker build -t ocp-toolbox .

# execute
docker build --rm -t ocp-centos8 .

docker run -itd --name centos -p 5000-5100:5000-5100 -v C:\tools:/tools ocp-centos8

# connect shell
docker exec -it toolbox bash



```

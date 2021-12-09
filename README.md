### build

```
# build
docker build -t ocp-toolbox .

# execute
docker run --name toolbox-3 -h toolbox-311 -v c:\tools\docker-pv:/pv-storage -itd ocp-toolbox

docker run --name toolbox-3 -h toolbox-311 -v /tools:/tools -itd ocp-toolbox

docker run --name toolbox-4 -h toolbox-4 -v c:\tools\docker-pv:/pv-storage -itd ocp-toolbox

# connect shell
docker exec -it toolbox bash
```

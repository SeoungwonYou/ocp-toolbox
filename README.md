### build

```
# build
docker build -t ocp-toolbox .

# execute
docker run --name toolbox -h toolbox-ocp-3_11 -v c:\tools\docker-pv:/pv-storage -itd ocp-toolbox

# connect shell
docker exec -it toolbox bash
```

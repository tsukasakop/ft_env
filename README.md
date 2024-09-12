# intro 

- with this environment, you can check your code works on `linux/amd64` `ubuntu:22.04`

- by typing `42env`, you can start virtual environment anyware

- the directory you type `42env` will be mounted in docker's `/workspace`

- in addition to essential build commands, `norminette` is available

- container will be created temporary, but running with option -r (`42env -r`), it remains

# set-up
```shell
make
source ~/.zshrc
```

# run

```shell
42env
```

## init

1. [install docker](https://www.docker.com/)

2. [run docker daemon](docker-desktop://)

3. clone this repository

4. build image
```shell
make
```

5. update alias
```shell
source ~/.zshrc
```

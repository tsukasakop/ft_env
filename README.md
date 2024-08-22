# set-up

```shell
docker build --platform linux/amd64 -t clang-12-x86_64-dev-environment .
```

```shell
docker run --platform linux/amd64 -it --rm -v $(pwd):/workspace clang-12-x86_64-dev-environment
```

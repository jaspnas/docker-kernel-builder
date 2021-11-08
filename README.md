# luxas/kernel-builder

Linux kernel build environment in Docker. Three images are available, with
GCC 10 (default), GCC 5, 7 and 8

https://hub.docker.com/r/jaspnas/kernel-builder

## Examples

Checkout `v4.19` stable branch of the kernel and compile it along with all modules 

```bash
docker run -it -v $(pwd)/.config:/tmp/.config jaspnas/kernel-builder:gcc-10 /bin/bash -c "\
	git fetch --tags && git checkout v4.19 && \
	cp /tmp/.config .config && \
	make oldconfig && \
	make -j16 && make modules_install"
```

## License

MIT

# luxas/kernel-builder

![Travis CI](https://api.travis-ci.com/luxas/docker-kernel-builder.svg?branch=master)

Linux kernel build environment in Docker. Three images are available, with
GCC 7 (default), GCC 5 and GCC 8. Travis CI builds the image on a weekly basis
to keep it fresh.

https://hub.docker.com/r/luxas/kernel-builder

## Examples

Checkout `v4.19` stable branch of the kernel and compile it along with all modules 

```bash
docker run -it -v $(pwd)/.config:/tmp/.config luxas/kernel-builder:gcc-7 /bin/bash -c "\
	git fetch --tags && git checkout v4.19 && \
	cp /tmp/.config .config && \
	make oldconfig && \
	make -j16 && make modules_install"
```

## License

MIT

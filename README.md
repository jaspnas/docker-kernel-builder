# docker-kernel-builder

![Travis CI](https://api.travis-ci.com/luxas/docker-kernel-builder.svg?branch=master)

Linux kernel build environment in Docker. Two images are available, one with
GCC 7 for newer kernels, and one with GCC 5 for older ones. Travis CI builds
the image on a weekly basis to keep it fresh.

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

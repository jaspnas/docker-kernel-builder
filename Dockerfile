FROM ubuntu:18.10

# Install dependencies
RUN apt-get -y -q update         \
 && apt-get -y -q upgrade        \
 && apt-get -y -q install        \
    bc                           \
    bison                        \
    build-essential              \
    ccache                       \
    flex                         \
    gcc-7                        \
    git                          \
    kmod                         \
    libelf-dev                   \
    libncurses-dev               \
    libssl-dev                   \
    wget                         \
 && apt-get clean

# Set up environment variables
ENV CCACHE_DIR=/ccache       \
    SRC_DIR=/usr/src         \
    DIST_DIR=/dist           \
    LINUX_DIR=/usr/src/linux \
    LINUX_REPO_URL=git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

# Fetch the latest kernel source
RUN mkdir -p ${SRC_DIR} ${CCACHE_DIR} ${DIST_DIR}  \
   && git clone ${LINUX_REPO_URL} ${LINUX_DIR}
RUN cd ${LINUX_DIR} && git fetch --tags

WORKDIR ${LINUX_DIR}

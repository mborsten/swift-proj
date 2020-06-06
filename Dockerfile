FROM swift:5.2-bionic

# Install dependencies
RUN apt-get update -y && apt-get install -y pkg-config \
wget \
sqlite3 \
libsqlite3-dev \
libtiff5-dev \
libcurl4-gnutls-dev

# Download proj
RUN wget https://download.osgeo.org/proj/proj-7.0.1.tar.gz

# Unpack
RUN tar -xzf proj-7.0.1.tar.gz

# Build & Install
RUN cd proj-7.0.1; ./configure; make; make install

# Create some symlinks that are needed for Vapor to find the
# header files
RUN ln -s /usr/local/lib/libproj.so.19.0.1 /usr/lib/libproj.so
RUN ln -s /usr/local/lib/libproj.so.19.0.1 /usr/lib/libproj.so.19

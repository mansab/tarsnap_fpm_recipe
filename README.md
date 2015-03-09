# class Tarsnap < FPM::Cookery::Recipe

This is an FPM recipe for building Tarsnap package from source.

Author: Mansab Uppal

Official site: http://mansab.upp.al

Official git repository: https://github.com/mansab/tarsnap_fpm_recipe

##Overview

This FPM recipe builds Tarsnap RPM and Debian packages by fetching the required version of Source Tarball (http://tarsnap.com/)

##Recipe description

The recipe will:

* Fetch the required version of Tarsnap from https://www.tarsnap.com/download.html.
* Verify the SHA256 hash with source tarball.
* ./configure Tarsnap client & bundle the source as an RPM/DEB package for CentOS/Ubuntu systems.

## Quick Start

### Requirements

The build server must have following packages installed:

### Ubuntu:
* openssl
* zlib1g
* e2fslibs
* libssl-devel
* zlib1g-dev
* e2fslibs-dev

### CentOS:
* openssl'
* zlib
* e2fsprogs
* glibc-devel
* openssl-devel
* zlib-devel
* e2fsprogs-devel

### Required GEM

* fpm-cookery

NOTE: The recipe has been tested with creating packages for 'amd64' and 'x86_64' architecture packages.

### Building a package
You need to specify the version of Tarsnap package to be fetched and built.

```fpm
BUILD_VERSION=1.0.35 fpm-cook
```

### Building a new release

```fpm
BUILD_VERSION=1.0.35 BUILD_REV=1 fpm-cook
```

### Related

* FPM Cookery: https://github.com/bernd/fpm-cookery
* Tarsnap: http://tarsnap.com

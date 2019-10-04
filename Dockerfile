FROM alpine

RUN apk update
RUN apk add --no-cache make
RUN apk add --no-cache linux-headers
RUN apk add --no-cache texinfo
RUN apk add --no-cache gcc
RUN apk add --no-cache g++
RUN apk add --no-cache gfortran
RUN apk add --no-cache cmake
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk
RUN apk add glibc-2.30-r0.apk

RUN mkdir gdb-build ;\
	cd gdb-build;\
	wget http://ftp.gnu.org/gnu/gdb/gdb-8.3.tar.xz;\
	tar -xvf gdb-8.3.tar.xz;\
	cd gdb-8.3/;\
	./configure --prefix=/usr;\
	make;\
	make -C gdb install;\
	cd /;\
	rm -rf /gdb-build/;

.PHONY: default clean

default: trunk/configure trunk/lwpr-1.2.6.tar.gz

# use this to generate configure script and makefiles with GNU autotools
trunk/configure:
	cd trunk && libtoolize \
	         && aclocal \
	         && autoconf \
	         && autoheader \
	         && automake -a 

trunk/lwpr-1.2.6.tar.gz:
	cd trunk && make dist

clean:
	make -C trunk $@
	rm -f trunk/configure trunk/lwpr-1.2.6.tar.gz

.PHONY: default clean

default: trunk/configure trunk/lwpr-1.2.6.tar.gz trunk/lwpr-1.2.6.zip

# use this to generate configure script and makefiles with GNU autotools
trunk/configure:
	cd trunk && libtoolize \
	         && aclocal \
	         && autoconf \
	         && autoheader \
	         && automake -a 

trunk/lwpr-1.2.6.tar.gz:
	cd trunk && make dist

trunk/lwpr-1.2.6.zip:
	cd trunk && make dist-zip

clean:
	make -C trunk $@
	rm -f trunk/configure trunk/lwpr-1.2.6.tar.gz

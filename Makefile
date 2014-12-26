.PHONY: default clean

default: trunk/configure lwpr-1.2.6.tar.gz

# use this to generate configure script and makefiles with GNU autotools
trunk/configure:
	cd trunk && libtoolize \
	         && aclocal \
	         && autoconf \
	         && autoheader \
	         && automake -a 

lwpr-1.2.6.tar.gz: default
	cp -r trunk  $(subst .tar.gz,,$@)
	tar -czvf $@ $(subst .tar.gz,,$@) --exclude=*.svn* --exclude=*.deps*  --exclude=*.lib* --exclude=*.lo --exclude=*.o

clean:
	make -C trunk $@
	rm -f trunk/configure lwpr-1.2.6.tar.gz

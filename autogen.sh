#!/bin/sh -x

rm -fv ltmain.sh config.sub config.guess config.h.in
aclocal -I m4
autoheader
libtoolize --automake --copy
automake --add-missing --copy --force
autoreconf
chmod 755 configure

for i in files-grp.c files-initgroups.c files-parse.c files-pwd.c files-spwd.c files-XXX.c ; do
	cp -a ../glibc/nss/nss_files/$i src/
done
sed -i -e 's|_nss_files_|_nss_usrfiles_|g' src/files-XXX.c
sed -i -e 's|/etc/|/usr/etc/|g' src/files-XXX.c

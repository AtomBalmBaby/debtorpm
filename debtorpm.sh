#/bin/bash

packagename=$1
packagename=${packagename%.*}
packagepath=$(realpath $packagename)

echo $packagepath

# extract the stuff
alien -r --scripts --fixperms -g $packagename.deb

#remove stupid directories that should not be in this file

sed -i 's#%dir "/"##' $packagename/*.spec
sed -i 's#%dir "/usr/"##' $packagename/*.spec
sed -i 's#%dir "/usr/bin/"##' $packagename/*.spec
sed -i 's#%dir "/usr/share/"##' $packagename/*.spec
sed -i 's#%dir "/usr/share/applications/"##' $packagename/*.spec

# tell the package we don't care about arch specific binaries in here

sed -i '12 i %define _binaries_in_noarch_packages_terminate_build 0' $packagename/*.spec


cd $packagename

rpmbuild --target=noarch --buildroot $packagepath/ \
         -bb $packagename-2.spec



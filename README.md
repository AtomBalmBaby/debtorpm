A bash script to automate the conversion of .deb files to .rpm

tested with Discord: discord-0.0.65.deb, discord-0.0.66.deb, discord-0.0.67.deb, discord-0.0.68.deb, discord-0.0.69.deb

to use:

`sudo path/to/debtorpm.sh discord-0.0.69.deb`

it will proccess the deb and eventually produce the rpm:

`discord-0.0.69-2.noarch.rpm`

Requirements:

alien, sed, rpmrebuild and some other packages I do not remember.  

I will add to this list when I get time to test it in a VM

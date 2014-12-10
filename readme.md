# Laravel Homestead for Apache

A fork of Laravel's Homestead, which runs on Apache rather than nginx and a CentOS box rather than Ubuntu.

Official Homestead documentation [is located here](http://laravel.com/docs/homestead?version=4.2).
Works exactly the same to configure.


### Box Packaging notes

These commands fix the eth1 initialisation error when box first loaded. Only to be done when packaging new versions of the box.

	rm -rf /etc/udev/rules.d/70-persistent-net.rules
	sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0
	sed -i '/UUID/d' /etc/sysconfig/network-scripts/ifcfg-eth0
	rm -rf /etc/sysconfig/network-scripts/ifcfg-eth1
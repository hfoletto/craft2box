# Craft2box
### A simple Vagrant box targeted for Craft 2 development
Craft2box is a simple Vagrant box running Ubuntu 16.04 and targeted for Craft development.

### Included software

* Ubuntu 16.04 (Xenial)
* Git
* sshpass
* Apache2
* Php 7.0 (mbstring, zip, GD, Mcrypt, cURL and ImageMagick mods included)
* MySQL 5.7
* Python 2.7
* NodeJS 8.16
* Yarn
* Ansible 2.6

### Defaults
MySQL username: `root`
MySQL password: `root`

Since MySQL 5.7.5+ changed the way `GROUP BY` behaves and Craft 2 relies on that, this vagrant box removes the `ONLY_FULL_GROUP_BY` option from `sql_mode`.  
Read more about it [here](https://craftcms.stackexchange.com/questions/12084/getting-this-sql-error-group-by-incompatible-with-sql-mode-only-full-group-by/12106).

### Vagrant Host Manager plugin
If you have `vagrant-hostmanager` plugin installed, this vagrant box will use it to manage the `hosts` file. The default alias is `craft.local`.
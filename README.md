# vagrantwrapper
A directory structure to support reuse of the vagrantpress vagrant setup

This is how the directory structure should be used:

    dev
    |-- plugins
    |      |-- Should contain any plugins that are required during development.
    |-- puppet
    |      |-- The puppet scripts for providing any custom puppet commands on top of vagrantpress.
    |-- scripts
    |      |-- Any scripts to run on the host.
    |-- theme
    |      |-- This folder will need to be created and should contain your theme files
	+-- vagrant
           |-- This folder will need to be created and contain a clone of vagrantpress files
           
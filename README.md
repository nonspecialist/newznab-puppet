What is it?
===========

A set of puppet manifests for installing newznab. Note that these manifests currently
work (without modification) with the free, fully GPLv3 version of newznab. 

If you want to use them to install the Newznab Plus (nnplus) version of newznab, go through
the donation process and then, once you've retrieved the software, rename the checked-out
directory to newznab-plus, and run

    zip -r9 newznab-plus.zip newznab-plus

and then copy the resulting zipfile to /var/tmp on the system that you're installing

What do I need?
===============

This is based on a CentOS 6 machine.

You'll need EPEL repositories enabled.

You'll need puppet (2.6+)

How do I install it?
====================

  1. clone this repo
  1. cd into the top level directory
  1. run (as root):

      puppet apply --modulepath=$( pwd )/modules manifests/init.pp

  1. Now browse to http://yournewserver/install and follow the normal install method

If you want to see what puppet is going to do, without doing it:

      puppet apply --noop --modulepath=$( pwd )/modules manifests/init.pp


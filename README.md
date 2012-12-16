What is it?
===========

A set of puppet manifests for installing newznab. Note that these manifests currently
work with the free, fully GPLv3 version of newznab. I've just recently got nnplus, and
I'm adjusting the manifests to cope with that as well.

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

  1. want to see what puppet is going to do, without doing it?

      puppet apply --noop --modulepath=$( pwd )/modules manifests/init.pp

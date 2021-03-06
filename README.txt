==============
zopache.webapp
==============

(Document the zopache.webapp project here.)
This project has been initially created with ZTFY.webapp version 1.1.4


Installation
============

Run the following steps::

  $ python bootstrap.py
  $ bin/buildout

If you have an error during the buildout process, you probably miss some
dependencies (development libs, tools and headers).


Tests
=====

Run::

  $ bin/test


Debugging
=========

To start a python interpreter with the same environment as your project, run::

  $ bin/ztpy

To start a python interpreter with the same environment as  your project and
with access to the ZODB database, run::

  $ bin/paster shell debug.ini # or deploy.ini

Here, you can access the root folder through the `root` variable, and a debugger
object through variable `debugger` or `app`. This object allows you to simulate
requests to the application and to access the ZODB root object.


Startup
=======

Check the WSGI configuration in deploy.ini and debug.ini

During development, run the following command to run the server::

  $ bin/paster serve debug.ini

For deployment, run::

  $ bin/paster serve --daemon deploy.ini

and use a process monitoring tool such as supervisord.


mod_wsgi
========

A configuration file is available in etc/mod_wsgi/zopache.webapp file.

It allows you to deploy your site under apache2 with mod_wsgi module, and
already contains required options for mod_ssl and mod_upload_progress modules
if they are available.

Under Debian, you just have to check this file to verify that hostname and
virtual host root are OK and to create a link in /etc/apache2/site-enabled
directory before restarting Apache to make your site available.

SSL settings are defined with default Debian's self-signed certificate; don't
forget to check and update these settings if you use a real signed certificate.

This file is not rebuild by buildout, so you can freely customize it according
to your own needs !

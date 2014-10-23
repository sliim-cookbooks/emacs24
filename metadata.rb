# -*- coding: utf-8 -*-

name             'emacs24'
maintainer       'Sliim'
maintainer_email 'sliim@mailoo.org'
license          'Apache 2.0'
description      'Installs/Configures emacs24'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

recipe 'emacs24', 'Install Emacs 24 from source.'

%w(apt build-essential).each do |cb|
  depends cb
end

%w(ubuntu debian).each do |os|
  supports os
end

#
# Cookbook Name:: emacs24
# Recipe:: default
#
# Copyright 2014, Sliim
#
# All rights reserved - Do Not Redistribute
#

localfile = Chef::Config[:file_cache_path] + "/emacs.tar.gz"
remote_file localfile do
  source "http://ftp.gnu.org/gnu/emacs/emacs-" + node["emacs24"]["version"] + ".tar.gz"
  mode "0644"
end

directory node["emacs24"]["build_dir"] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

execute "untar" do
  cwd node["emacs24"]["build_dir"]
  command "tar --strip-components 1 -xzf " + localfile
end

execute "configure and make" do
  cwd node["emacs24"]["build_dir"]
  command "./configure && make"
end

execute "make install" do
  cwd node["emacs24"]["build_dir"]
  command "sudo make install"
end

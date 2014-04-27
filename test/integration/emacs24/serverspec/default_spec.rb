require "spec_helper"

describe file("/opt/emacs") do
  it { should be_directory }
end

describe file("/opt/emacs/README") do
  it { should be_file }
end

describe file("/opt/emacs/src/emacs") do
  it { should be_file }
end

describe file("/usr/local/bin/emacs") do
  it { should be_file }
end

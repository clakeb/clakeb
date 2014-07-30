default[:system][:user]     = "clakeb"
default[:system][:group]    = "staff"
default[:system][:home_dir] = "~/"

include_attribute "clakeb::brew"
include_attribute "clakeb::rbenv"
include_attribute "clakeb::misc"
# include_attribute "clakeb::sup"
include_attribute "clakeb::dev"

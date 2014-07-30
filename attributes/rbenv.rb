rbenv = default[:rbenv]

rbenv[:repo] = "https://github.com/sstephenson/rbenv.git"

rbenv[:repo][:revision] = "master"
rbenv[:repo][:location] = "/Users/#{node[:system][:user]}/.rbenv"

rbenv[:plugins][:locations] = "/Users/#{node[:system][:user]}/.rbenv/plugins"
rbenv[:plugins] = {
  "ruby-build"       => "https://github.com/sstephenson/ruby-build.git",
  "rbenv-gem-rehash" => "https://github.com/sstephenson/rbenv-gem-rehash.git",
  "rbenv-vars"       => "https://github.com/sstephenson/rbenv-vars.git",
  "rbenv-aliases"    => "https://github.com/tpope/rbenv-aliases.git",
  "rbenv-gem-update" => "https://github.com/nicknovitski/rbenv-gem-update.git",
  "rbenv-update"     => "https://github.com/rkh/rbenv-update.git"
}

rbenv[:install] = {
  :rubies => {
    "2.1.2" => [
      "bundler",
      "chef",
      "berkshelf",
      "test-kitchen",
      "rails",
    ],
    "1.9.3-p547" => [
      "bundler",
      "sup",
      "ncursesw"
    ]
  }
}

dev = default[:dev]

dev[:dirs] = {
  "Development" => [],
  "Development/sites" => [
    "https://github.com/clakeb/clakeb.github.io.git",
    "https://github.com/clakeb/devhoard.com.git",
    "https://github.com/clakeb/for-sale.git",
  ],
  "Development/cookbooks" => [],
  "Development/projects" => [],
  "Development/projects/nodes" => [
    "https://github.com/clakeb/node-trello.git",
  ],
  "Development/projects/apms" => [
    "https://github.com/clakeb/atom-trello.git",
    "https://github.com/clakeb/sftp-deployment.git",
  ],
  "Development/projects/brews" => [
    "https://github.com/clakeb/homebrew.git",
    "https://github.com/clakeb/homebrew-cask.git",
    "https://github.com/clakeb/homebrew-clakeb.git",
  ],
  "Development/projects/gems" => [
    "https://github.com/clakeb/trello_cli.git",
    "https://github.com/clakeb/chefenv.git",
    "https://github.com/clakeb/knife-block.git",
    "https://github.com/clakeb/knife-bag.git",
  ],
  "Development/projects/st3" => [
    "https://github.com/clakeb/WordPress-Generate-Salts.git",
    "https://github.com/clakeb/sublime-text-trello.git",
  ],
  "Development/projects/cookbooks" => [],
  "Development/projects/wp" => [],
  "Development/projects/wp/plugins" => [],
  "Development/projects/wp/themes" => [],
  "Development/projects/wp/core" => [],
  "Development/projects/wp/tools" => [],
  "Documents/Presentations" => [
    "https://github.com/grantnorwood/cluster-fudge.git",
  ],
}

# APM
dev[:apms] = [
  "assign-align",
  "atom-mac-theme",
  "atom-rails",
  "emmet",
  "language-apache",
  "language-chef",
  "maximize-panes",
  "peacock-syntax",
  "project-manager",
  "project-runner",
  "wordpress",
  "wordpress-api",
]

# NPM
dev[:npms] = [
  "yo",
  "brunch",
  "grunt",
  "grunt-cli",
  "bower",
]

node.reverse_merge!(
  nodenv: {
    scheme:      'git',
    nodenv_root: File.join(ENV['HOME'], '.nodenv'),
    user:        ENV['USER'],
    versions:    [],
  },
)

include_recipe 'nodenv::install'

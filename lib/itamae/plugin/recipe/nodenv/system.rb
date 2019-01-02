node.reverse_merge!(
  nodenv: {
    scheme:      'git',
    nodenv_root: '/usr/local/nodenv',
    versions:    [],
  },
)

include_recipe 'nodenv::install'

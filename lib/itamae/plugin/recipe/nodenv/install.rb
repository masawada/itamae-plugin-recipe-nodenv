package 'git'

scheme      = node[:nodenv][:scheme]
nodenv_root = node[:nodenv][:nodenv_root]

git nodenv_root do
  repository "#{scheme}://github.com/nodenv/nodenv.git"
  user node[:nodenv][:user] if node[:nodenv][:user]
end

directory File.join(nodenv_root, 'plugins') do
  user node[:nodenv][:user] if node[:nodenv][:user]
end

git "#{nodenv_root}/plugins/node-build" do
  repository "#{scheme}://github.com/nodenv/node-build.git"
  user node[:nodenv][:user] if node[:nodenv][:user]
end

nodenv_init = <<-EOS
  export NODENV_ROOT=#{nodenv_root}
  export PATH="#{nodenv_root}/bin:${PATH}"
  eval "$(nodenv init -)"
EOS

node[:nodenv][:versions].each do |version|
  execute "nodenv install #{version}" do
    command "#{nodenv_init} nodenv install #{version}"
    not_if  "#{nodenv_init} nodenv versions | grep #{version}"
    user node[:nodenv][:user] if node[:nodenv][:user]
  end
end

if node[:nodenv][:global]
  node[:nodenv][:global].tap do |version|
    execute "nodenv global #{version}" do
      command "#{nodenv_init} nodenv global #{version}"
      not_if  "#{nodenv_init} nodenv version | grep #{version}"
      user node[:nodenv][:user] if node[:nodenv][:user]
    end
  end
end

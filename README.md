# Itamae::Plugin::Recipe::Nodenv

[itamae](https://github.com/itamae-kitchen/itamae) plugin to install node with nodenv

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-nodenv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-nodenv

## Usage

### System wide installation

Install nodenv into /usr/local/nodenv

#### Recipe

```ruby
include_recipe "nodenv::system"
```

#### Configuration

Write a yaml file:

```yaml
# node.yaml
nodenv:
  global:
    10.15.0
  versions:
    - 11.6.0
    - 10.15.0

  # used in git clone (default: git)
  scheme: https

  # nodenv root dir (default: /usr/local/nodenv)
  nodenv_root: /path/to/nodenv_root
```

and execute:

```console
$ itamae -y node.yml
```

### User local installation

#### Recipe

```ruby
include_recipe "nodenv::user"
```

#### Configuration

```yaml
# node.yaml
nodenv:
  user: masawada
  global:
    10.15.0
  versions:
    - 11.6.0
    - 10.15.0

  # used in git clone (default: git)
  scheme: https

  # nodenv root dir (default: $HOME/.nodenv)
  nodenv_root: /path/to/nodenv_root
```

and execute:

```console
$ itamae -y node.yml
```

## mitamae support

It can be used as [mitamae](https://github.com/itamae-kitchen/mitamae) plugin.

Put this repository under `./plugins` as a git submodule:

```console
$ git submodule add https://github.com/masawada/itamae-plugin-recipe-nodenv.git plugins/itamae-plugin-recipe-nodenv
```

and write a recipe:

```ruby
node.reverse_merge!(
  nodenv: {
    user: 'masawada',
    global: '10.15.0',
    versions: %w[
      11.6.0
      10.15.0
    ],
  },
)

include_recipe "nodenv::user"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masawada/itamae-plugin-recipe-nodenv.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

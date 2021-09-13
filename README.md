# Documentation

Documentation can be generated with the command:

```sh
yard doc 'lib/**/*.rb'
```

This will generate a documentation which can be viewed within the doc folder.

# Specs

Specs can be run with the command:

```sh
bundle exec rake
```

This will generate a coverage report which can be viewed within the coverage folder.

# Rubocop

Rubocop can be run with the command:

```ruby
# Run rubocop on lib folder
rubocop 'lib'

# Run rubcop on all files
rubocop
```

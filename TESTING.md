# Testing

Run the local quality gates with:

```text
cookstyle
chef exec rspec --format documentation
```

The integration suite is Windows-only and is defined in the `default` Kitchen suite:

```text
kitchen test default-windows-2019 --destroy=always
```

The default suite converges the test cookbook recipe in `test/cookbooks/test/recipes/default.rb` and verifies the resulting installation and Git configuration with InSpec from `test/integration/default/`.

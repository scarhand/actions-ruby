# GitHub Actions for NPM

This Action for [rubygems](https://rubygems.org/) enables arbitrary actions with the `gem` command-line client, including publishing to a registry.

## Usage

An example workflow to build and publish a gem to the default public registry follows:

```hcl
workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "scarhand/actions-ruby@master"
  args = "build *.gemspec"
}

# Filter for a new tag
action "Tag" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "tag v*"
}

action "Publish" {
  needs = "Build"
  uses = "scarhand/actions-ruby@master"
  args = "push *.gem"
  secrets = ["RUBYGEMS_AUTH_TOKEN"]
}
```

### Secrets

* `RUBYGEMS_AUTH_TOKEN` - **Optional**. The token to use for authentication with the rubygems repository. Required for `gem push`.

### Environment variables

* `RUBYGEMS_HOST` - **Optional**. To specify a repository to authenticate with. Defaults to `https://rubygems.org` [more info](https://guides.rubygems.org/command-reference/#gem-environment). 

#### Example

To authenticate with, and publish to, a registry other than `https://rubygems.org`:

```hcl
action "Publish" {
  uses = "scarhand/actions-ruby@master"
  args = "push *.gem"
  env = {
    GEM_REPOSITORY_URL = "https://someOtherrepository.someDomain.net"
  }
  secrets = ["GEM_AUTH_TOKEN"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Hello! Thank you for choosing to help contribute to one of the SendGrid open source libraries. There are many ways you can contribute and help is always welcome. We simply ask that you follow the following contribution policies.

- [Improvements to the Codebase](#improvements-to-the-codebase)
- [Understanding the Code Base](#understanding-the-codebase)
- [Testing](#testing)
- [Style Guidelines & Naming Conventions](#style-guidelines-and-naming-conventions)
- [Creating a Pull Request](#creating-a-pull-request)
- [Code Reviews](#code-reviews)

<a name="improvements-to-the-codebase"></a>
## Improvements to the Codebase

We welcome direct contributions to the ruby-http-client code base. Thank you!

### Development Environment ###

#### Install and Run Locally ####

##### Prerequisites #####

- Ruby version 2.2

##### Initial setup: #####

```bash
git clone https://github.com/sendgrid/ruby-http-client.git
cd ruby-http-client
```

### Environment Variables

First, get your free SendGrid account [here](https://sendgrid.com/free?source=ruby-http-client).

Next, update your environment with your [SENDGRID_API_KEY](https://app.sendgrid.com/settings/api_keys).

```bash
echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
echo "sendgrid.env" >> .gitignore
source ./sendgrid.env
```

##### Execute: #####

See the [examples folder](examples) to get started quickly.

To run the example (after updating the emails):

```bash
ruby examples/example.rb
```

<a name="understanding-the-codebase"></a>
## Understanding the Code Base

**/examples**

Working examples that demonstrate usage.

**ruby_http_client.rb**

An HTTP client with a fluent interface using method chaining and reflection. By returning self on [method_missing](lib/ruby_http_client.rb#L209) and [_()](lib/ruby_http_client.rb#L194), we can dynamically build the URL using method chaining and [method_missing](lib/ruby_http_client.rb#L209) allows us to dynamically receive the method calls to achieve reflection.

This allows for the following mapping from a URL to a method chain:

`/api_client/{api_key_id}/version` maps to `client.api_client._(api_key_id).version.<method>()` where <method> is a [HTTP verb](lib/ruby_http_client.rb#L38).

<a name="testing"></a>
## Testing

All PRs require passing tests before the PR will be reviewed.

All test files are in the [`test`](test) directory.

For the purposes of contributing to this repo, please update the [`test_ruby_http_client.rb`](test/test_ruby_http_client.rb) file with unit tests as you modify the code.

To run the tests:

```bash
rake
```

<a name="style-guidelines-and-naming-conventions"></a>
## Style Guidelines & Naming Conventions

Generally, we follow the style guidelines as suggested by the official language. However, we ask that you conform to the styles that already exist in the library. If you wish to deviate, please explain your reasoning.

- [Community Driven Style Guide](https://github.com/bbatsov/ruby-style-guide)

Please run your code through:

- [rubocop](https://github.com/bbatsov/rubocop).

## Creating a Pull Request<a name="creating-a-pull-request"></a>

1. [Fork](https://help.github.com/fork-a-repo/) the project, clone your fork,
   and configure the remotes:

   ```bash
   # Clone your fork of the repo into the current directory
   git clone https://github.com/sendgrid/ruby-http-client
   # Navigate to the newly cloned directory
   cd ruby-http-client
   # Assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/sendgrid/ruby-http-client
   ```

2. If you cloned a while ago, get the latest changes from upstream:

   ```bash
   git checkout <dev-branch>
   git pull upstream <dev-branch>
   ```

3. Create a new topic branch off the `development` branch to
   contain your feature, change, or fix:

   ```bash
   git checkout -b <topic-branch-name>
   ```

4. Commit your changes in logical chunks. Please adhere to these [git commit
   message guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
   or your code is unlikely to be merged into the main project. Use Git's
   [interactive rebase](https://help.github.com/articles/interactive-rebase)
   feature to tidy up your commits before making them public.

4a. Create tests.

4b. Create or update the example code that demonstrates the functionality of this change to the code.

5. Locally merge (or rebase) the upstream development branch into your topic branch:

   ```bash
   git pull [--rebase] upstream development
   ```

6. Push your topic branch up to your fork:

   ```bash
   git push origin <topic-branch-name>
   ```

7. [Open a Pull Request](https://help.github.com/articles/using-pull-requests/)
    with a clear title and description against the `development` branch. All tests must be passing before we will review the PR.

<a name="code-reviews"></a>
## Code Reviews

If you can, please look at open PRs and review them. Give feedback and help us merge these PRs much faster! If you don't know how, Github has some great <a href="https://help.github.com/articles/about-pull-request-reviews/">information on how to review a Pull Request.</a>

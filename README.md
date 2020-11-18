# Page Views
A ruby app that parses web logs, outputs a list of the pages and how many times each has been viewed.

## Installation

### Clone the repository

```shell
git clone git@github.com:ashqar/page_views.git
cd page_views
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler gem](https://github.com/bundler/bundler):

```shell
bundle install
```

### Running test suite

```shell
rake test
```

### Running Page Views App

```shell
ruby bin/page_views.rb data/webserver.log
```

### Future work

- Create classes for styling and printing output
- Create Pages class to handle actions on array of pages e.g. sorting
- Write edge cases for specs
- LogImporter to receive different types of classes rather than the constant type of Page
- Add continuous integration to project

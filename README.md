[![Build Status](https://travis-ci.org/andreychernih/missing_translations.png?branch=master)](https://travis-ci.org/andreychernih/missing_translations)
# missing_translations

Shows missing I18n keys in Rails applications. It parses all view files searching for [t] helper invocation. [haml], [erb] and [slim] (without Translator plugin) views are supported.

## Installation

Add the following line to your ```Gemfile```:

```ruby
gem 'missing_translations'
```

## How to run

```
bundle exec rake missing_translations
```

Example output in one project of mine:

```
% rake missing_translations
Searching in app/views/admin/app_versions/nodes.html.erb
...
Searching in app/views/layouts/application.html.slim

Missing translations
en.logo.alt
en.layouts.application.welcome.message
```

[haml]: http://haml.info/
[erb]: http://ruby-doc.org/stdlib-2.1.2/libdoc/erb/rdoc/ERB.html
[slim]: http://slim-lang.com/
[t]: http://api.rubyonrails.org/classes/ActionView/Helpers/TranslationHelper.html#method-i-t

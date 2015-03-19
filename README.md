# ActionParamsSanitizer

Pretty simple objectifying wrapper for action params.

Allows to describe the input parameters with a simple DSL. In result you take:

1. The data encapsulation
2. Work with the parameters as an object
3. Easy testable service object

## Installation

Add this line to your application's Gemfile:

    gem 'action_params_sanitizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_params_sanitizer

## Usage

### Defining new params sanitizers

Default place for params wrappers is `app/params_sanitizers`. By convention all
wrappers of one controller must be contained in namespace accordingly to a
controller name. Name of class is accordingly to a action name. For
example:

```ruby
class Users::CreateParamsSanitizer < ActionParamsSanitizer::Base
end
```

And the class above must be contained in next folder structure `app/params_sanitizers/users/create_params_sanitizer.rb`.

### Describe single param

For example, input params is:

```json
{
  some_key: :some_value,
  another_key: :another_value
}
```

For describing this case use `ActionParamsSanitizer::Base.param` method:

```ruby
class Users::CreateParamsSanitizer < ActionParamsSanitizer::Base
  param :some_key
  param :another_key
end
```

Also you may passing keys array:

```ruby
class Users::CreateParamsSanitizer < ActionParamsSanitizer::Base
  param :some_key, :another_key
end
```

### Describe resource

For example, input params contains resource attributes:

```json
{
  user:{
    email: 'some@mail.com',
    nickname: 'some_user'
  }
}
```

For describing resource you must use
`ActionParamsSanitizer::Base.resource` method:

```ruby
class Users::CreateParamsSanitizer < ActionParamsSanitizer::Base
  resource :user
end
```

By default all subparameters are permitted, but you can specify
permitted ones:

```ruby
class Users::CreateParamsSanitizer < ActionParamsSanitizer::Base
  resource user: [:nickname]
end
```

Resource describing creates public method containing resource name and
`_params` prefix. Looking to example above it will be `user_params`
method.

### Using in controller

You may calling params sanitizers implicitly and explicitly.

Implicitly calling `create_params` somewhere in `UsersController` will
instantiate `Users::CreateParamsSanitizer` and return params object.

For calling explicitly see following example:

```ruby
class UsersController
  private

  def useful_params
    Users::SomeAnotherParamsSanitizer.new(params)
  end
end
```

### Scoping single params

In some cases you want to extract single param from resource. Explicit
scope passing to single param definition will help you:

```ruby
class Users::CreateParamsSanitizer < ActionParamsSanitizer::Base
  resource :user
  param :nickname, scope: -> { user_params }
end
```

Scope is a lambda where _self_ takes _Users::CreateParamsSanitizer_ instance.

## Further work

1. Default values for single param
2. Custom names
3. Prefix for scoped single params
4. Ability for permitting and single param access by user role

## Contributing

1. Fork it ( https://github.com/[my-github-username]/action_params_sanitizer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

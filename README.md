# ⚡️kaminari_guard🛡️

`kaminari_guard` is a gem that helps you detect missing `paginate` method calls in `kaminari`, ensuring that your pagination works correctly.

## Installation

Gemfile
```ruby
group :development, :test do
  gem 'kaminari_guard'
end
```

## Usage

In app/controllers/application_controller.rb

```ruby
class ApplicationController < ActionController::Base
  kaminari_guard unless Rails.env.production?
end
```

In app/models/application_record.rb

```ruby
class ApplicationRecord < ActiveRecord::Base
  kaminari_guard unless Rails.env.production?
end
```

## Example

The following code will raise an exception.

```ruby
class PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page])
  end
end
```

```erb
<% if @posts.present? %>
  <% @posts.each do |post| %>
    <div><%= post.title %></div>
  <% end %>
  <!-- Forgot to call the `paginate` helper -->
<% else %>
  <div>No posts</div>
<% end %>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KaminariGuard project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aki77/kaminari_guard/blob/main/CODE_OF_CONDUCT.md).

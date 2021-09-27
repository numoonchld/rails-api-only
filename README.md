# Rails API App

## Setup

- `rails new rails-api-only -T --api`

  - to setup postgres db instead of default sqlite3:
    - `rails new rails-api-only -T --api -d postgresql`

- add to Gemfile:

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
end
```

- then
  - `bundle install`
  - `rails generate rspec:install`

## Generate Article Model

- `rails generate model Article title:string content:text`
- `rails db:migrate`

## Testing

- `rspec spec/models/article_spec.rb`
- detailed `rspec` results: `rspec --format=documentation`

## Inspecting Routes

- `rails routes`
- routes filter
  - `rails routes | grep articles` or `rails routes -g articles`
  - `rails routes | grep -v rails`

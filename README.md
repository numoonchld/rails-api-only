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

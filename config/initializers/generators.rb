# frozen_string_literal: true

Rails.application.config.generators do |g|
  g.scaffold_stylesheet false
  g.stylesheets false
  g.javascripts false

  g.test_framework :rspec,
    view_specs: false,
    helper_specs: false
end

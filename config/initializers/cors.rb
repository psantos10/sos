# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins %r{https?://(.*?)\.sos\.local$}

    resource '*',
      headers: :any,
      methods: %i[get post put patch delete options head]
  end

  allow do
    origins %r{https?://(.*?)\.sos\.ao$}

    resource '*',
      headers: :any,
      methods: %i[get post put patch delete options head]
  end
end

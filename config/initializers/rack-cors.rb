# config/initializers/rack-cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://new-life-jade.vercel.app' # You can specify specific origins or use '*' for any origin
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
  
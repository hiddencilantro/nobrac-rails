# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://the-nobrac-initiative.netlify.app"

    resource "/api/v1/users",
      headers: :any,
      methods: [:post]
    resource "/api/v1/users/*",
      headers: :any,
      methods: [:get]
    resource "/api/v1/footprints",
      headers: :any,
      methods: [:post]
    resource "/api/v1/footprints/*",
      headers: :any,
      methods: [:delete]
    resource "/api/v1/login",
      headers: :any,
      methods: [:post]
  end
end

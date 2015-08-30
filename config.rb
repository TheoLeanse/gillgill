# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

require "bootstrap-sass"

set :css_dir, './stylesheets'

set :js_dir, './javascripts'

set :images_dir, './images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

case ENV['TARGET'].to_s.downcase
when 'production'
  activate :deploy do |deploy|
    deploy.deploy_method   = :ftp
    deploy.host            = 'ftp.example.com'
    deploy.path            = '/srv/www/site'
    deploy.user            = 'tvaughan'
    deploy.password        = 'secret'
  end
else
  activate :deploy do |deploy|
    deploy.method         = :git
    deploy.remote         = 'https://github.com/TheoLeanse/gillgill.git'
    deploy.branch         = 'gh-pages'
    deploy.commit_message = 'deploying test site'
  end
end

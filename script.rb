require 'contentful'
require 'pry-byebug'
require 'transifex'
require 'dotenv'

Dotenv.load
client = Contentful::Client.new(
  space: ENV['CONTENTFUL_SPACE'],  # This is the space ID. A space is like a project folder in Contentful terms
  access_token: ENV['CONTENTFUL_TOKEN']
)

Transifex.configure do |c|
  c.client_login = ENV['TF_LOGIN']
  c.client_secret = ENV['TF_SECRET']
end

binding.pry
# This API call will request an entry with the specified ID from the space defined at the top, using a space-specific access token.
# entry = client.entry('4z6FoIRMsE7QrUMfGGqysD', locale: 'en')
puts 11

transifex_project = Transifex::Project.new('lumos-static-site-generator')
transifex_project.languages.fetch
transifex_project.resources.fetch

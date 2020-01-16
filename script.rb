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
entry = client.entry('EIo6nUr4D351f0Tu3tE4B', locale: 'en')
# entry = client.entry('4z6FoIRMsE7QrUMfGGqysD', locale: 'en')
# entry = client.entry('13lM9WJGDaBBL79WoqWrGR', locale: 'en')
puts 11

# transifex_project = Transifex::Project.new('lumos-static-site-generator')
# transifex_project.languages.fetch
# transifex_project.resources.fetch
# project_resource = transifex_project.resource("enjson_1-heads_master")
# project_resource.fetch_with_details
# JSON.parse project_resource.content.fetch

# resource_translation = project_resource.translation('en')
# resource_translation_strings = resource_translation.strings
# params = {:key => "welcome", :context => "", :translation => "new_translation"}
# resource_translation_strings.update(params)

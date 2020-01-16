require 'contentful'
require 'contentful/management'
require 'pry-byebug'
require 'transifex'
require 'dotenv'

Dotenv.load

management_client = Contentful::Management::Client.new(ENV['CONTENTFUL_MANAGEMENET_TOKEN'])

environment = management_client.environments(ENV['CONTENTFUL_SPACE']).find('master')
entry = environment.entries.find('QwHmCigc2q6FZiGwURgjm')
puts entry.fields_for_query
content_type = environment.content_types.find(entry.raw_object['sys']['contentType']['sys']['id'])
puts content_type.fields.first.properties
# entry.localized_short_text = {'fr' => 'fr text'}


delivery_client = Contentful::Client.new(space: ENV['CONTENTFUL_SPACE'], access_token: ENV['CONTENTFUL_TOKEN'])
# entry = delivery_client.entry('QwHmCigc2q6FZiGwURgjm')
# entry = client.entry('13lM9WJGDaBBL79WoqWrGR', locale: 'en')

Transifex.configure do |c|
  c.client_login = ENV['TF_LOGIN']
  c.client_secret = ENV['TF_SECRET']
end

transifex_project = Transifex::Project.new('lumos-static-site-generator')
binding.pry

transifex_project.languages.fetch
# transifex_project.resources.fetch
# project_resource = transifex_project.resource("enjson_1-heads_master")
# project_resource.fetch_with_details
# JSON.parse project_resource.content.fetch

# resource_translation = project_resource.translation('en')
# resource_translation_strings = resource_translation.strings
# params = {:key => "welcome", :context => "", :translation => "new_translation"}
# resource_translation_strings.update(params)

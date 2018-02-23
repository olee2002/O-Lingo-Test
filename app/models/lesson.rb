class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :language

  include HTTParty
  require 'net/https'
  require 'uri'
  require 'cgi'
  require 'json'

# **********************************************
# *** Update or verify the following values. ***
# **********************************************

# Replace the key string value with your valid subscription key.
key = '6a54283bc5134e1f8058ec86bd9fa516'

host = 'https://api.microsofttranslator.com'
path = '/V2/Http.svc/Translate'

target = 'ko'
text = 'Hello'

params = '?to=' + target + '&text=' + CGI.escape(text)
uri = URI (host + path + params)

request = Net::HTTP::Get.new(uri)
request['Ocp-Apim-Subscription-Key'] = key

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request (request)
end

puts Hash.from_xml(response.body).to_json

end

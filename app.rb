require 'sinatra'
require 'slack-ruby-client'

get '/' do
  'Hello world!'
end

get '/auth' do
  client_id = '1052655198181.1050480329478'
  scope = 'chat:write:bot'
  redirect_uri = 'http://localhost:4567/auth_success'
  redirect "https://slack.com/oauth/authorize?client_id=#{client_id}&scope=#{scope}&redirect_uri=#{redirect_uri}"
end

get '/auth_success' do
  client_id = '1052655198181.1050480329478'
  client_secret = '886859a42adcabce467cf04375d63f97'
  code = params['code']

  client = Slack::Web::Client.new

  # Request a token using the temporary code
  client.oauth_access(
    client_id: client_id,
    client_secret: client_secret,
    code: code
  )

  # puts client.auth_test
  client.chat_postMessage(channel: '#f1-news', text: 'Hello World', as_user: true)

  "All done!"
end



get '/posty' do
  Slack.configure do |config|
    config.token = '333DLQ0I4jOUr9zpiuECZBV5'
  end

  client = Slack::Web::Client.new
  client.auth_test
end



# get '/auth_code' do
#   client_id = '1052655198181.1050480329478'
#   client_secret = '886859a42adcabce467cf04375d63f97'
#   code = params['code']
#   redirect_uri = 'http://localhost:4567/auth_success'
#   redirect "https://slack.com/api/oauth.access?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}&redirect_uri=#{redirect_uri}"
# end

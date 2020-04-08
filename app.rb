require 'sinatra'

get '/' do
  'Hello world!'
end

get '/auth' do
  client_id = '1052655198181.1050480329478'
  scope = 'chat:write:bot'
  redirect_uri = 'https://f1news-slack.herokuapp.com/auth_code'
  redirect "https://slack.com/oauth/authorize?client_id=#{client_id}&scope=#{scope}&redirect_uri=#{redirect_uri}"
end

get '/auth_code' do
  client_id = '1052655198181.1050480329478'
  client_secret = '886859a42adcabce467cf04375d63f97'
  code = params['code']
  redirect_uri = 'https://f1news-slack.herokuapp.com/auth_success'
  redirect "https://slack.com/api/oauth.access?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}&redirect_uri=#{redirect_uri}"
end

get '/auth_success' do
  "All done!"
end

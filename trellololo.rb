require 'sinatra'
require 'json'

get '/' do
  ENV['TW_LOGIN']
end

post '/trello/callback' do
  params = JSON.parse(request.env["rack.input"].read)
  raise params.inspect
  [200, {}, "Hello from a Trellololo world! Params: #{params}"]
end

require 'sinatra'

get '/' do
  'Hello world!'
end

post '/trello/callback' do
  [200, {}, "Hello from a Trellololo world! Params: #{params}"]
end

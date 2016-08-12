require 'sinatra'

get '/' do
  'Hello world!'
end

post '/trello/callback' do
  puts '[Params]'
  p params
end

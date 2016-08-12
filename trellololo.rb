require 'sinatra'

get '/' do
  'Hello world!'
end

post '/trello/callback' do
  '[Params]'
  puts params
end

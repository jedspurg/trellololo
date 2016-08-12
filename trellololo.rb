require 'sinatra'
before do
  puts '[Params]'
  p params
end
get '/' do
  'Hello world!'
end
post '/trello/callback' do

end

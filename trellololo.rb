require 'sinatra'

enable :logging, :dump_errors, :raise_errors

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

before do
  puts '[Params]'
  p params
end
get '/' do
  'Hello world!'
end
post '/trello/callback' do

end

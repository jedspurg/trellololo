require 'sinatra'
require 'json'
require 'rest_client'
# require 'activerecord'

CREATE_ACTION       = 'createCard'.freeze
OPTIMIZATIONS_LIST  = 624902


get '/' do
  'Get OUT!'
end

post '/trello/callback' do
  @params = JSON.parse(request.env["rack.input"].read)
  case @params['model']['action']['type']
  when CREATE_ACTION
    create_tw_task
  end
  # raise params.inspect
  [200, {}, "Successfully created TeamWork Task"]
end

def create_tw_task
  response = RestClient.post "https://mobi.teamwork.com/tasklists/#{OPTIMIZATIONS_LIST}/tasks.json", create_hash.to_json, content_type: :json, accept: :json, authorization: "Basic #{ENV['TW_AUTH']}"
  response.code
end

def update_tw_task
end

def create_hash
  {
    "todo-item" => {
      "content"           => @params['model']['action']['card']['name'],
      "description"       => @params['model']['action']['card'].fetch('desc', nil),
      "priority"          => "low",
      "tags"              => "api_integration_testing"
    }
  }
end

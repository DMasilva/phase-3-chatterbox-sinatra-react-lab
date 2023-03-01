class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add routes
  get '/messages' do
    Message.all.to_json
  end

  get '/messages/:id' do
    Message.find(params[:id]).to_json
  end

  post '/messages' do
    Message.create(username: params[:username], body: params[:body]).to_json
  end

  patch '/messages/:id' do
    Message.find(params[:id]).update(params).to_json
    Message.find(params[:id]).to_json
  end
  delete '/messages/:id' do
    Message.find(params[:id]).destroy.to_json
  end
end

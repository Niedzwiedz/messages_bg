require 'bundler'
Bundler.require

require 'sinatra'
require_relative 'helper/message_queue'

get '/' do
  'Example usage: curl -X POST -d ' \
    '"enter message here" http://localhost:4567'
end

# POST method takes request data and sends it to queue
post '/' do
  message = request.body.read

  msg_que = MessageQueue.new
  msg_que.send(message)
end

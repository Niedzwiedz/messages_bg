require 'bunny'

## MessageQueue handles message sending
## to 'message' queue
##
## - send - takes message and
##   sends it to queue, then closes
##   connection
class MessageQueue
  def initialize
    @conn = Bunny.new
    @conn.start

    @ch = @conn.create_channel
    @q = @ch.queue('message')
  end

  def send(message)
    @ch.default_exchange.publish(message, routing_key: @q.name)
    @conn.close
  end
end

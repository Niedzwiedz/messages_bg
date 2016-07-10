require 'bunny'

conn = Bunny.new
conn.start

ch = conn.create_channel
q = ch.queue('message')

begin
  puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"
  q.subscribe(manual_ack: true, block: true) do |delivery_info, _properties, body|
    puts "  [x] Received: #{body}"
    ch.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  conn.close
  exit(0)
end

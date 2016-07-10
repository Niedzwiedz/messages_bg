# Messages BG

Simple Sinatra web application. It is able to post messages to rabbitmq message queue. Posted messages can be read by included script.

## Prequisities

Ruby 2.2.4+

Install and run rabbitmq server. Follow installation [guide](https://www.rabbitmq.com/download.html) on their website.

## Usage

In messages_bg folder run `bundle install` to install required gems.

To start web application run `ruby app/message.rb`.

Post messages by using curl. Example usage:
`curl -X POST -d 'your message' http://localhost:4567`

To read posted messages run `ruby receive_script/receive.rb`.
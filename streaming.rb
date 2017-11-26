require 'rack/app'

require 'rack/app'
class Streaming < Rack::App
  serializer(&:to_s)

  get '/' do
    i = 0
    stream do |out|
      loop do
        out << i = i.next
        break if i == 5
      end
    end
  end
end

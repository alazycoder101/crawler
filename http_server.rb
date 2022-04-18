require 'socket'

port = ENV['PORT'] || 80
socket = TCPServer.new(port)

loop do
  client = socket.accept
  first_line = client.gets
  verb, path, _ = first_line.split

  if verb == 'GET'
    if result = path.match(/^\/customers\/(.*?)$/)
      client_id = result[1]
      response = "HTTP/1.1 200\r\n\r\nHey, #{client_id}!"
      client.puts(response)
    end
  end

  client.close
end

socket.close

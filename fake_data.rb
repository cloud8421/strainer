require 'socket'
require 'msgpack'

throttle = 0.3

socket = UDPSocket.new
socket.connect("10.2.20.57", 9001)

channels = %w(main user articles tags)

10000.times do |n|
  msg = { channel: channels.sample, message: "some message #{n}" }
  socket.send msg.to_msgpack, 0
  sleep throttle
end

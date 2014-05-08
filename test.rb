require 'socket'

event = "wtf"

socket = UDPSocket.new
socket.connect("127.0.0.1", 9001)
socket.send event, 0

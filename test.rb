require 'socket'

event = "wtf"

socket = UDPSocket.new
socket.connect("10.2.20.57", 9001)
socket.send event, 0

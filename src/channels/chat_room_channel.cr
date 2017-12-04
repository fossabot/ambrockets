class ChatRoomChannel < Amber::WebSockets::Channel
  def handle_joined(client_socket, message)
    ChatSocket.broadcast("message", "chat_room:hello", "message_new", {
      "user"    => "",
      "message" => "#{client_socket.session["user"]} joined to ambrockets!",
    })
  end

  def handle_message(client_socket, message)
    rebroadcast!(message)
  end

  def handle_leave(client_socket)
    ChatSocket.broadcast("message", "chat_room:hello", "message_new", {
      "user" => "",
      "message" => "#{client_socket.session["user"]} left ambrockets..."
    })
  end
end

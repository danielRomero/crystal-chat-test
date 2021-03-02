class BaseWebsocket
  def self.on_join(socket)
    WebsocketManager.instance.add_socket(socket)
  end

  def self.on_close(socket)
    WebsocketManager.instance.remove_socket(socket)
  end

  # WARNING: BE CAREFUL USING THIS FUNCTION
  def self.broadcast(message)
    WebsocketManager.instance.all_sockets.each { |socket| socket.send message}
  end
end

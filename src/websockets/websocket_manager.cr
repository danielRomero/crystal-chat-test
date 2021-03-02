# singleton class to manage sockets storage

# TODO: for production move to redis or something like that to manage
# distributed shared memory
class WebsocketManager
  SOCKETS = [] of HTTP::WebSocket

  def all_sockets
    SOCKETS
  end

  def add_socket(socket : HTTP::WebSocket)
    SOCKETS << socket
  end

  def remove_socket(socket : HTTP::WebSocket)
    SOCKETS.delete(socket)
  end

  def self.instance
    @@instance ||= WebsocketManager.new
  end
end

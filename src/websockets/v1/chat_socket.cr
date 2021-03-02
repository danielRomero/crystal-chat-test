module Websocket
  module V1
    class ChatSocket < BaseWebsocket
      # Broadcast each message to all clients
      def self.message(_env, _socket, message)
        broadcast(message)
      end
    end
  end
end

module Web
  module V1
    class ChatsController < WebBaseController
      def new
        render_view("chats/new")
      end
    end
  end
end

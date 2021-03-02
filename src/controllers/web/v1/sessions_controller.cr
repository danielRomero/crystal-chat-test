module Web
  module V1
    class SessionsController < WebBaseController
      def new
        render_view("sessions/new")
      end

      def create
        puts env.params.body["email"]?.inspect

        user = User.query.find({ email: env.params.body["email"]? })

        if user && user.verify_password(env.params.body["password"].to_s)
          # CREATE THE SESSION
          # Session.sign_in(user) or something like this
          env.redirect "/chats"
        else
          render_view("sessions/new")
        end
      end
    end
  end
end

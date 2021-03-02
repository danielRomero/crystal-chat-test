module Web
  module V1
    class RegistrationsController < WebBaseController
      def new
        render_view("registrations/new")
      end

      def create
        user = User.new(env.params.body.to_h)
        user.password = env.params.body.to_h["password"]? || ""
        user.save!
        render_view("sessions/new")
      end
    end
  end
end

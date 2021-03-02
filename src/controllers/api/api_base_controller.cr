# common class to all api controllers to set the content_type (overridable if needed)
module API
  class APIBaseController < BaseController
    def initialize(@env : HTTP::Server::Context)
      @env.response.content_type = "application/json"
      super(@env)
    end
  end
end

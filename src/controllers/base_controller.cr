class BaseController
  # for now this class only gets the `env` context from the web framework (kemal)
  # and makes it accessible in all the controllers and views
  private getter env : HTTP::Server::Context

  def initialize(@env : HTTP::Server::Context)
  end
end

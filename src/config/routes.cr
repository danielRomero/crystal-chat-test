module Routes
  include Macros::RouterBase

  # API
  get("/api/v1/_health", API::V1::Status, :_health)

  # WEB
  get("/registrations", Web::V1::Registrations, :new)
  post("/registrations", Web::V1::Registrations, :create)

  get("/sessions", Web::V1::Sessions, :new)
  post("/sessions", Web::V1::Sessions, :create)

  get("/chats", Web::V1::Chats, :new)

  # Websockets
  ws("/chat", Websocket::V1::Chat, :message)
end

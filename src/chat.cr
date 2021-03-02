# super cool ORM with A LOT of postgresql features: https://clear.gitbook.io/project/
require "clear"
# web framework like sinatra: https://kemalcr.com/guide/
require "kemal"

# macros and things like that to make life easier
require "./lib/**"

require "./controllers/**"
require "./websockets/**"
require "./models/**"
require "./config/routes"
require "./db/migrations/*"

module Chat
  def self.start
    # initialize DB
    # create DB with this: PGPASSWORD=postgres psql -h 127.0.0.1 -p 5432 -U postgres -c 'create database chat_example;'
    # Clear::SQL.init("postgres://postgres:postgres@127.0.0.1/chat_example")
    Clear::SQL.init("postgres://postgres:postgres@db/chat_example")

    # call DB migrations
    Clear::Migration::Manager.instance.apply_all

    # simple configuration of the framework (can be in other file)
    static_headers do |response, filepath, filestat|
      if filepath =~ /\.html$/
        response.headers.add("Access-Control-Allow-Origin", "*")
      end
      response.headers.add("Content-Size", filestat.size.to_s)
    end
    serve_static({"gzip" => true, "dir_listing" => false})

    # start the web server
    Kemal.run
  end
end

# this can be in other module and even the config can be injected at this point
# like the running environment to configure the server params or the database configuration
Chat.start()

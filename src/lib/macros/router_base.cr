# this macro transform the config/routes.cr entries to the Kemal framework way, so creates a new
# endpoint to every entry and call the controller and the function that match.
# if anything is not working or is missconfigured it raises an error at compile time.
module Macros
  module RouterBase
    HTTP_METHODS = %w(get post put patch delete options)

    {% for method in HTTP_METHODS %}
      macro {{method.id}}(path, class_name, function_name)
        # `method` will not be available within the verbatim block
        \{% method = {{method}} %}

        {% verbatim do %}
          ::{{method.id}} {{path}} do |env|
            {{class_name.id}}Controller.new(env).{{function_name.id}}
          end
        {% end %}
      end
    {% end %}

    macro ws(path, class_name, function_name)
      ::ws({{path}}) do |socket, env|

        {{class_name.id}}Socket.on_join(socket)

        socket.on_message do |message|
          {{class_name.id}}Socket.{{function_name.id}}(env, socket, message)
        end

        socket.on_close do
          {{class_name.id}}Socket.on_close(socket)
        end
      end
    end
  end
end

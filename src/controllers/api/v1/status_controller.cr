module API
  module V1
    # dummy class to check the JSON API
    class StatusController < APIBaseController
      # TODO check the database health and other external dependencies
      def _health
        {
            server: {
              status: :ok
            },
            database: {
              status: :ok
            }
          }.to_json
      end
    end
  end
end

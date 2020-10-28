module Controller
  module Api
    class Base
      attr_reader :context, :request, :params

      def initialize(context)
        @context  = context
        @request  = @context.request
        @params   = @request.params
      end

      def params
        # Format params dependant of content-type
        if @request.content_type == 'application/json'
          @request.body.rewind
          JSON.parse(@request.body.read).transform_keys(&:to_sym)
        else
          @params.transform_keys(&:to_sym)
        end
      end
    end
  end
end
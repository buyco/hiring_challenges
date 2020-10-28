module Controller
  module Api
    class BoxTypesCountersController < Base
      def index
        [200, {
            metal: BoxTypesCounter.metal.amount
          }
        ]
      end
    end
  end
end
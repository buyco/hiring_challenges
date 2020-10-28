module Controller
  module Api
    class BoxesController < Base
      def index
        boxes = Box.all
        [200, { 
            data: boxes.map(&:attributes), size: boxes.count 
          }
        ]
      end

      def create
        box = Box.new(params)
        box, res = box.save
        if res
          # Notify rabbitmq if created box is a metal type
          Notifier.notify({ type: 'metal' }) if box.metal?
          [201, {
            data: box.attributes
            }
          ]
        else
          [422, {
            errors: box.errors 
            }
          ]
        end
      end
    end
  end
end
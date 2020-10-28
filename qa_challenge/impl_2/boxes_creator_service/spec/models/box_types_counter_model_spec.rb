require "spec_helper"

RSpec.describe BoxTypesCounter, type: :model do
  def app
    ApplicationController
  end

  describe "BoxTypesCounter model" do
    let(:attr) do
      { name: 'metal', amount: 0 }
    end
  
    context "box_type_counter" do      
      it "init box_type_counter" do
        box_type_counter = BoxTypesCounter.new(attr)
        expect(box_type_counter).kind_of? BoxTypesCounter
        expect(box_type_counter.name).not_to be(nil)
      end

      it "create box_type_counter" do
        box_type_counter = BoxTypesCounter.new(attr)
        box_type_counter, res = box_type_counter.save
        expect(res).to eq(true)
        expect(box_type_counter.id).not_to eq(nil)
      end

      it "box errors" do
        box_type_counter = BoxTypesCounter.new({})
        box_type_counter, res = box_type_counter.save
        expect(res).to eq(false)
        expect(box_type_counter.id).to eq(nil)
        expect(box_type_counter.errors).not_to be_empty
      end
    end

    context "class methods" do      
      it "get metal box_type_counter" do
        box_type_counter = BoxTypesCounter.new(attr)
        box_type_counter, res = box_type_counter.save

        metal = BoxTypesCounter.metal
        expect(metal.id).to eq(box_type_counter.id)
      end
    end
  end
end
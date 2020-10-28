require "spec_helper"

RSpec.describe Box, type: :model do
  def app
    ApplicationController
  end

  describe "Box model" do
    let(:attr) do
      { type: "metal", locked: true, height: 100, width: 150, depth: 200, contents: "Super", origin: {line1: "line1", line2: "line2", city: "city", state: "state", postal_code: "postal_code", country: "fra"} }
    end
  
    context "box" do      
      it "init box" do
        box = Box.new(attr)
        expect(box).kind_of? Box
        expect(box.origin).kind_of? Hash
        expect(box.metal?).to eq(true)
      end

      it "create box" do
        box = Box.new(attr)
        box, res = box.save
        expect(res).to eq(true)
        expect(box.id).not_to eq(nil)
      end

      it "box errors" do
        box = Box.new({})
        box, res = box.save
        expect(res).to eq(false)
        expect(box.id).to eq(nil)
        expect(box.errors).not_to be_empty
      end
    end
  end
end
require "spec_helper"

RSpec.describe Base, type: :model do
  def app
    ApplicationController
  end

  describe "Base model" do
    let(:attr) do
      { id: 1 }
    end
  
    context "base" do      
      it "init base" do
        base = Base.new(attr)
        expect(base).kind_of? Base
        expect(base.id).to eq(1)
      end
    end
  end
end
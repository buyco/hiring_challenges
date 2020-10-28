require "spec_helper"

RSpec.describe Controller::Api::BoxTypesCountersController do
  def app
    ApplicationController
  end

  describe "GET boxtype" do
    let(:json) {JSON.parse(last_response.body)}

    context "boxes" do      
      it "create box" do
        get "/api/box_types_counters"
        expect(json['metal']).to eq(0)
        expect(last_response.status).to eq 200
      end
    end
  end
end
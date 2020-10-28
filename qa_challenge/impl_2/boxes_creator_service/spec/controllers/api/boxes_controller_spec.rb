require "spec_helper"

RSpec.describe Controller::Api::BoxesController do
  def app
    ApplicationController
  end

  describe "GET boxes" do
    let(:json) {JSON.parse(last_response.body)}

    context "no boxes" do      
      it "returns no boxes" do
        get "/api/boxes"
        expect(json).to eq({ 'data' => [], 'size' => 0 })
        expect(last_response.status).to eq 200
      end
    end

    context "boxes" do      
      it "create box" do
        post "/api/boxes", { type: "metal", locked: true, height: 100, width: 150, depth: 200, contents: "Super", origin: {line1: "line1", line2: "line2", city: "city", state: "state", postal_code: "postal_code", country: "fra"} }.to_json, {'CONTENT_TYPE' => 'application/json'}
        expect(json['data']['id']).not_to eq(nil)
        expect(last_response.status).to eq 201
      end
    end
  end
end
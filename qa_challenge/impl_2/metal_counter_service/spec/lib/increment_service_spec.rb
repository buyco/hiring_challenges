require "byebug"
require "spec_helper"
require_relative "../../lib/increment_service"

RSpec.describe IncrementService, type: :service do

  describe "IncrementService" do
    subject { IncrementService }
    let(:test_type) { 'test_type' }

    context "methods" do
      it "find or create record if not exist" do
        test_type_counter = subject.find_or_create(test_type)
        expect(test_type_counter['id']).not_to be_nil
        expect(test_type_counter['amount']).not_to be_nil
        expect(test_type_counter['name']).to eq(test_type)

        test_type_counter_2 = subject.find_or_create(test_type)
        expect(test_type_counter['id']).to eq(test_type_counter_2['id'])
      end

      it "should update record amount" do
        test_type_counter = subject.find_or_create(test_type)
        udpdated = subject.update(test_type_counter['id'], 10)

        expect(udpdated['amount'].to_i).to eq(10)
        expect(udpdated['id']).to eq(test_type_counter['id'])
      end

      it "should increment type" do
        inc_time = 3
        inc_time.times do 
          subject.increment(type: test_type)
        end

        test_type_counter = subject.find_or_create(test_type)
        expect(test_type_counter['amount'].to_i).to eq(inc_time)
      end
    end
  end
end
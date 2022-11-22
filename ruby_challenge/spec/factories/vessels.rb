# frozen_string_literal: true

# == Schema Information
#
# Table name: vessels
#
#  id              :bigint           not null, primary key
#  departure       :datetime         not null
#  full            :boolean          default(FALSE), not null
#  kg_weight_limit :integer          not null
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :vessel do
    name { Faker::Company.name }
    kg_weight_limit { 12_000_000 }
    departure { Time.zone.today.change(hour: 16) }
    full { false }

    trait :full do
      full { true }
    end
  end
end

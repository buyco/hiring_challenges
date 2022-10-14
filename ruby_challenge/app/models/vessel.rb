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
class Vessel < ApplicationRecord
end

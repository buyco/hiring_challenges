# == Schema Information
#
# Table name: containers
#
#  id         :bigint           not null, primary key
#  size       :string           not null
#  state      :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#  vessel_id  :bigint
#
# Indexes
#
#  index_containers_on_user_id    (user_id)
#  index_containers_on_vessel_id  (vessel_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vessel_id => vessels.id)
#
require 'rails_helper'

RSpec.describe Container, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

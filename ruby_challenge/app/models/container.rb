# frozen_string_literal: true

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
class Container < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :user
  belongs_to :vessel, optional: true

  validates :type, inclusion: { in: Containers::TYPES }
  validates :state, inclusion: { in: Containers::STATES }
  validates :size, inclusion: { in: Containers::SIZES }

  after_commit :schedule_container

  def schedule_container
    StuffContainerJob.perform_later(self)
  end
end

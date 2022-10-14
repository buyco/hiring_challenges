# frozen_string_literal: true

module Containers
  STATES = %w[PENDING READY STUFFED].freeze
  TYPES = %w[DRY REEFER OPEN_TOP].freeze
  SIZES = %w[20 40].freeze
  WEIGHTS = {
    REEFER20: 27_400,
    REEFER40: 27_700,
    DRY20: 25_000,
    DRY40: 27_600,
    OPEN_TOP20: 28_130,
    OPEN_TOP40: 26_630
  }.freeze
end

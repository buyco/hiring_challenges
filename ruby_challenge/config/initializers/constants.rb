# frozen_string_literal: true

module Containers
  STATES = %w[pending ready stuffed].freeze
  TYPES = %w[DRY REEFER OPEN_TOP].freeze
  SIZES = %w[20 40].freeze
  WEIGHTS = {
    reefer20: 27_400,
    reefer40: 27_700,
    dry20: 25_000,
    dry40: 27_600,
    open_top20: 28_130,
    open_top40: 26_630
  }.freeze
end

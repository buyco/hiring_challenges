class Box < Base
  SCHEMA      = { id: Integer, type: String, locked: [TrueClass, FalseClass], height: Integer, width: Integer, depth: Integer, contents: String, origin: Hash }
  FIELDS      = SCHEMA.keys.freeze
  ORIGIN_KEY  = %i[line1 line2 city state postal_code country].freeze
  TYPES       = %i[cardboard metal wood]
  attr_accessor *FIELDS

  def self.table_name
    'boxes'
  end

  def initialize(attr={})
    super(attr)
    value = attr['origin'] || attr[:origin]
    value = JSON.parse(value) if value.is_a?(String)
    self.origin = value
    self
  end

  def metal?
    # return true if instance is a metal type
    type.to_sym == :metal
  end

  def save
    return super if valid?

    [self, false]
  end

  def valid?
    # Validations
    ## fields
    invalid_type!(:type)                      unless valid_type?(:type)
    invalid_type!(:locked)                    unless (locked == true || locked == false)
    invalid_type!(:height)                    unless valid_type?(:height)
    invalid_type!(:width)                     unless valid_type?(:width)
    invalid_type!(:depth)                     unless valid_type?(:depth)
    invalid_type!(:contents)                  unless valid_type?(:contents)
    invalid_type!(:origin)                    unless valid_type?(:origin)
    add_error(:type, "Can't be blank")        if type.nil? || type.empty?
    add_error(:locked, "Can't be blank")      if locked.nil?
    add_error(:height, "Can't be blank")      if height.nil?
    add_error(:width, "Can't be blank")       if width.nil?
    add_error(:depth, "Can't be blank")       if depth.nil?
    add_error(:contents, "Can't be blank")    if contents.nil? || contents.empty?
    add_error(:origin, "Can't be blank")      if origin.nil? || origin.empty?

    ## type
    unless TYPES.include?(type&.to_sym)
      add_error(:type, "Invalid value, possible are : #{TYPES.join(', ')}")
    end

    ## origin
    ORIGIN_KEY.each do |origin_key|
      val = origin ? (origin[origin_key.to_s] ||origin[origin_key.to_sym]) : nil
      add_error(:"origin.#{origin_key}", "Can't be blank") if val.nil? || val.empty?

      if origin_key.to_sym == :country && !(Regex::ISO_3166_ALPHA_3.match?(val))
        add_error(:"origin.#{origin_key}", "field have an invalid format, use ISO_3166_ALPHA_3")
      end
    end

    errors.count.zero?
  end
end
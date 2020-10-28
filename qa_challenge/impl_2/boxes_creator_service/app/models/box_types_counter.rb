class BoxTypesCounter < Base
  FIELDS = %i[id name amount].freeze
  SCHEMA      = { id: Integer, name: String, amount: Integer }
  attr_accessor *FIELDS

  def self.metal
    # Return metal box_type_counter
    res = connection.exec_params("SELECT * FROM #{table_name} WHERE #{table_name}.name = $1", ['metal'])
    unless res.first
      connection.exec_params("INSERT INTO #{table_name}(name, amount) VALUES($1, $2)", ['metal', 0])
      res = connection.exec_params("SELECT * FROM #{table_name} WHERE #{table_name}.name = $1", ['metal'])
    end
    close
    return new(res.first)
  end

  def save
    return super if valid?

    [self, false]
  end

  def valid?
    # Validations
    invalid_type!(:name)                      unless valid_type?(:name)
    invalid_type!(:amount)                    unless valid_type?(:amount)

    add_error(:name, "Can't be blank")        if name.nil?
    add_error(:amount, "Can't be blank")      if amount.nil?

    errors.count.zero?
  end
end
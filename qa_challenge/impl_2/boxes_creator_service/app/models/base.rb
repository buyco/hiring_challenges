class Base
  FORBBIDEN_FIELDS = %i[id]
  SCHEMA = { id: Integer }
  FIELDS = SCHEMA.keys.freeze
  attr_reader :errors
  attr_accessor :id

  def self.connection
    @@connection ||= Db::Connector.connect
    @@connection.type_map_for_results = PG::BasicTypeMapForResults.new(@@connection)
    @@connection
  end

  def self.close
    @@connection.close
    @@connection = nil
  end

  def self.table_name
    "#{name.gsub(/(.)([A-Z])/,'\1_\2').downcase}s"
  end

  def self.all
    results = connection.exec_params("SELECT * FROM #{table_name}")
    results.map { |row| new(row) }
  end

  def self.find(id)
    res = connection.exec_params("SELECT * FROM #{table_name} WHERE #{table_name}.id = $1", [id])
    close
    new(res.first) if res.first
  end

  def self.create(attr={})
    # Format origin field
    attr['origin'] = attr['origin'].to_json if attr['origin']
    fields = self::FIELDS.select do |field|
      value = attr[field] || attr[field.to_s]
      # skip forbbiden fields
      value && !FORBBIDEN_FIELDS.include?(field.to_sym)
    end
    # build values
    values = fields.map{ |field| attr[field] || attr[field.to_s] }
    # build sql vars name
    vars = values.each_with_index.map{ |field, idx| "$#{idx+1}" }
    # build query
    query = "INSERT INTO #{table_name}(#{fields.join(', ')}) VALUES(#{vars.join(', ')}) RETURNING *;"
    # create record
    res = connection.exec_params(query, values)
    close
    # return instancied record
    [new(res.first), true]
  end

  def initialize(attr={})
    # set attributes values to instance fields
    self.class::FIELDS.map(&:to_sym).each do |field|
      value = attr[field] || attr[field.to_s]
      self.send("#{field}=", value)
    end
    # build errors
    @errors = []
    self
  end

  def attributes
    hash = {}
    # convert instance fields to hash
    self.instance_variables.each {|var| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
    hash
  end

  def save
    if id
      # not in use in this app but if an if exist, need update record instead of create
      self
    else
      self.class.create(self.attributes)
    end
  end

  def valid_type?(field)
    # get right type in schema
    type = self.class::SCHEMA[field.to_sym]
    # get value
    val = self.send(field)
    
    # check if is multi-types field
    if type.is_a?(Array)
      return type.include?(val.class)
    end
    
    # check field type
    val.is_a?(type)
  end

  def invalid_type!(field)
    # add erroned type to given field
    add_error(field, 'Invalid field type')
  end

  def add_error(field, message)
    # add field and custom message to errors
    hash = @errors.find { |h| h.keys.first.to_sym == field.to_sym }
    if hash
      hash[field] ||= []
      hash[field].push(message)
    else
      @errors.push({ :"#{field}" => [message] })
    end
    @errors
  end
end
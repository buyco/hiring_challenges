require_relative './db/connector'

class IncrementService
  def self.increment(opt={})
    # Increment given box_counter_type ('metal' by default)
    type        = opt.fetch(:type, 'metal')
    box_type    = find_or_create(type)
    new_amount  = (box_type['amount'].to_i + 1)
    result      = update(box_type['id'], new_amount)

    puts "Boxes of type #{type} was inscremented ! New amount is #{new_amount}"
    true
  end

  def self.update(id, amount)
    # Update method
    res = connection.exec_params("UPDATE box_types_counters SET amount = $1 WHERE id = $2 RETURNING *;", [amount, id])
    close
    res.first
  end

  def self.find_or_create(type)
    # Try to find record by type
    res = connection.exec_params("SELECT box_types_counters.* FROM box_types_counters WHERE box_types_counters.name = $1", [type])
    unless box_type = res.first
      # Or create it if not exist
      res = connection.exec_params("INSERT INTO box_types_counters(name, amount) VALUES($1, 0) RETURNING *;", [type])
      box_type = res.first
    end
    close

    box_type
  end


  def self.connection
    @@connection ||= Db::Connector.connect
  end

  def self.close
    @@connection.close
    @@connection = nil
  end
end

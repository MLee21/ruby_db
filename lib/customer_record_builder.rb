require_relative 'file_handler'
require_relative 'customer_profile'

class CustomerRecordBuilder

  def initialize(file)
    @file = file
  end

  def parse_records
    FileHandler.new(@file).parse
  end

  def create_customer_records
    parse_records.map { |row| CustomerProfile.new(row) }
  end

end
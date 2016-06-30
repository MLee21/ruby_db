require "customer_record_builder"

class DataRetriever

  def initialize(file)
    @file = file
    @customer_record_builder = CustomerRecordBuilder.new(file)
  end

  def all
    @customer_record_builder.create_customer_records
  end

end
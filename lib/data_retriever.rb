require_relative "customer_record_builder"
require 'json'

class DataRetriever

  def initialize(file)
    @file = file
    @customer_record_builder = CustomerRecordBuilder.new(file)
  end

  def all
    @customer_record_builder.create_customer_records
  end

  def sort_by_gender
    all.sort_by { |k,v| k.gender }
  end

  def sort_by_last_name_ascending
    all.sort_by { |k,v| k.last_name }
  end

  def sort_by_dob_ascending
    all.map.sort_by { |k,v| Date.strptime(k.date_of_birth, "%m/%d/%Y") }
  end

  def sort_by_last_name_descending
    sort_by_last_name_ascending.reverse
  end

  def convert_to_json(data)
    data.map { |record| JSON.dump({ :date_of_birth => record.date_of_birth, :favorite_color => record.favorite_color, :first_name => record.first_name, :gender => record.gender, :id => record.id, :last_name => record.last_name }) }
  end
end

if __FILE__ == $0
  file = ARGV.first
  data_retriever = DataRetriever.new(file)
  File.open('all.txt', 'w') { |f| f.write(data_retriever.convert_to_json(data_retriever.all)) }
  File.open('gender.txt', 'w') { |f| f.write(data_retriever.convert_to_json(data_retriever.sort_by_gender)) }
  File.open('last_name_asc.txt', 'w') { |f| f.write(data_retriever.convert_to_json(data_retriever.sort_by_last_name_ascending)) }
  File.open('dob.txt', 'w') { |f| f.write(data_retriever.convert_to_json(data_retriever.sort_by_dob_ascending)) }
  File.open('last_name_desc.txt', 'w') { |f| f.write(data_retriever.convert_to_json(data_retriever.sort_by_last_name_descending)) }
end
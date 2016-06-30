require "customer_record_builder"

describe CustomerRecordBuilder do 
  describe "#build_customer_record" do 
    context "when a file of records is received" do 

      before(:each) do 
        @file_path = File.expand_path'../../customer_data_test.csv',__FILE__
        @customer_record_builder = CustomerRecordBuilder.new(@file_path)
      end

      it "should receive a file and be able to parse the data" do 
        parsed_records = @customer_record_builder.parse_records
        expect(parsed_records.first).to eq("1,Washington,Brenda,Female,Violet,10/18/1977")
      end

      it "should take the parsed data and create customer records" do 
        customer_records = @customer_record_builder.create_customer_records
        expect(customer_records.first.id).to eq(1)
        expect(customer_records.first.last_name).to eq("Washington")
        expect(customer_records.first.first_name).to eq("Brenda")
      end
    end
  end
end
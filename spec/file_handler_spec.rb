require "file_handler"

describe FileHandler do 
  attr_accessor :file_handler

  describe "#parse_file" do 

    context "when there is a comma delimited file" do 
      before(:each) do 
        test_data = 'customer_data_test.csv'
        @file_handler = FileHandler.new(test_data)
      end

      it "should have an empty csv array" do 
        expect(file_handler.csv).to eq([])
      end

      it "should return the list of csv data" do 
        expect(file_handler.parse.length).to eq(50)
      end

      it "should return a row of data that has no trailing whitespaces, new lines, or carriage returns" do 
        expect(file_handler.parse.first).to eq("1,Washington,Brenda,Female,Violet,10/18/1977")
      end
    end

    context "when there is a pipe delimited file" do 
      before(:each) do 
        pipe_delimited_test_data = 'customer_data_pd_test.csv'
        @file_handler = FileHandler.new(pipe_delimited_test_data)
      end

      it "should have any empty csv array" do 
        expect(file_handler.csv).to eq([])
      end

      it "should return the list of txt data" do 
        expect(file_handler.parse.length).to eq(50)
      end

      it "should return a row of data that has no trailing whitespaces, new lines, or carriage returns" do 
        expect(file_handler.parse.first).to eq("1|Matthews|Andrew|Male|Khaki|07/24/1987")
      end
    end

  end
end
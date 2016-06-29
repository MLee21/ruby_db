require "file_reader"

describe FileReader do 
  attr_accessor :file_reader


  describe "#parse_file" do 

    context "when there is a comma delimited file" do 
      before(:each) do 
        test_data = 'customer_data_test.csv'
        @file_reader = FileReader.new(test_data)
      end

      it "should have an empty csv array" do 
        expect(file_reader.csv).to eq([])
      end

      it "should return the list of csv data" do 
        expect(file_reader.parse.length).to eq(51)
      end

      it "should return a row of data that has no trailing whitespaces, new lines, or carriage returns" do 
        expect(file_reader.parse.first).to eq("id,LastName,FirstName,Gender,FavoriteColor,DateOfBirth")
      end
    end

    context "when there is a pipe delimited file" do 
      before(:each) do 
        pipe_delimited_test_data = 'customer_data_pd_test.csv'
        @file_reader = FileReader.new(pipe_delimited_test_data)
      end

      it "should have any empty csv array" do 
        expect(file_reader.csv).to eq([])
      end

      it "should return the list of txt data" do 
        expect(file_reader.parse.length).to eq(51)
      end

      it "should return a row of data that has no trailing whitespaces, new lines, or carriage returns" do 
        expect(file_reader.parse.first).to eq("id|LastName|FirstName|Gender|FavoriteColor|DateOfBirth")
      end
    end

  end
end
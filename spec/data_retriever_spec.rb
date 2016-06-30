require "data_retriever"

describe DataRetriever do 
  describe "#all" do 
    context "when the data is retrieved" do 

      before(:each) do 
        @file_path = File.expand_path'../../customer_data_pd_test.csv',__FILE__
        @data_retriever = DataRetriever.new(@file_path)
      end

      it "should return all of the records" do 
        expect(@data_retriever.all.count).to eq(50)
      end
    end
  end
end
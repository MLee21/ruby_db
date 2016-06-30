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

      it "should return records sorted by gender (f before m)" do 
        expect(@data_retriever.sort_by_gender.first.gender).to eq('Female')
        expect(@data_retriever.sort_by_gender.last.gender).to eq('Male')
      end

      it "should return records by last name ascending" do 
        expect(@data_retriever.sort_by_last_name_ascending.first.last_name).to eq("Alvarez")
        expect(@data_retriever.sort_by_last_name_ascending.last.last_name).to eq("Williams")
      end

      it "should return records by date of birth ascending" do 
        expect(@data_retriever.sort_by_dob_ascending.first.date_of_birth).to eq("12/20/1970")
        expect(@data_retriever.sort_by_dob_ascending.last.date_of_birth).to eq("06/10/1996")
      end

      it "should return records by last name descending" do 
        expect(@data_retriever.sort_by_last_name_descending.first.last_name).to eq("Williams")
        expect(@data_retriever.sort_by_last_name_descending.last.last_name).to eq("Alvarez")
      end
    end
  end
end
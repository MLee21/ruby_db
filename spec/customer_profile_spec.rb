require "customer_profile"
require "file_handler"

describe CustomerProfile do 

  describe "#information" do 

    context "when there is a new customer" do 

      it "should create an array based on the delimiter: comma" do 
        info = "1,Washington,Brenda,Female,Violet,10/18/1977"
        @customer = CustomerProfile.new(info)
        expect(@customer.data).to eq(["1", "Washington", "Brenda", "Female", "Violet", "10/18/1977"])
        info_2 = "1|Matthews|Andrew|Male|Khaki|07/24/1987"
        @customer = CustomerProfile.new(info_2)
        expect(@customer.data).to eq(["1", "Matthews", "Andrew", "Male", "Khaki", "07/24/1987"])
      end

      it "should create a customer object with hash attributes from comma delimited" do 
        info = "1,Washington,Brenda,Female,Violet,10/18/1977"
        @customer = CustomerProfile.new(info)
        expect(@customer.id).to eq(1)
        expect(@customer.last_name).to eq("Washington")
        expect(@customer.first_name).to eq("Brenda")
        expect(@customer.gender).to eq("Female")
        expect(@customer.favorite_color).to eq("Violet")
        expect(@customer.date_of_birth).to eq("10/18/1977")
      end

      it "should create a customer object with hash attributes from pipe delimited" do 
        info = "1|Matthews|Andrew|Male|Khaki|07/24/1987"
        @customer = CustomerProfile.new(info)
        expect(@customer.id).to eq(1)
        expect(@customer.last_name).to eq("Matthews")
        expect(@customer.first_name).to eq("Andrew")
        expect(@customer.gender).to eq("Male")
        expect(@customer.favorite_color).to eq("Khaki")
        expect(@customer.date_of_birth).to eq("07/24/1987")
      end
    end
  end

end
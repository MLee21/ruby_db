require "customer_profile"
require "file_reader"

describe CustomerProfile do 

  describe "#information" do 

    context "when there is a new customer" do 

      it "should create an array based on the delimiter" do 
        info = "1,Washington,Brenda,Female,Violet,10/18/1977"
        @customer = CustomerProfile.new(info)
        expect(@customer.data).to eq(["1", "Washington", "Brenda", "Female", "Violet", "10/18/1977"])
        info_2 = "1|Matthews|Andrew|Male|Khaki|07/24/1987"
        @customer = CustomerProfile.new(info_2)
        expect(@customer.data).to eq(["1", "Matthews", "Andrew", "Male", "Khaki", "07/24/1987"])
      end


      it "should create a customer object with hash attributes" do 
        info = "1,Washington,Brenda,Female,Violet,10/18/1977"
        @customer = CustomerProfile.new(info)
        expect(@customer.id).to eq(1)
        expect(@customer.last_name).to eq("Fox")
        expect(@customer.first_name).to eq("Heather")
        expect(@customer.gender).to eq("Female")
        expect(@customer.favorite_color).to eq("Turquoise")
        expect(@customer.date_of_birth).to eq(Time.new(customer.date_of_birth).strftime("%m/%d/%Y"))
      end
    end
  end

end
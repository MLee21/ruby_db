class CustomerProfile

  attr_accessor :id,
                :last_name,
                :first_name,
                :gender,
                :favorite_color,
                :date_of_birth,
                :data

  def initialize(data)
    @data = delimiter_splitter(data)
    require 'pry'
    binding.pry;
  end

  def delimiter_splitter(data)
    if data.include?(",")
      data.split(",") 
    else
      data.split("|")
    end
  end

end
class CustomerProfile

  ARRAY = %w(id last_name first_name gender favorite_color date_of_birth)

  attr_accessor :id,
                :last_name,
                :first_name,
                :gender,
                :favorite_color,
                :date_of_birth,
                :data

  def initialize(data)
    @data = delimiter_splitter(data)
    @id = create_hash_attributes[:id].to_i
    @last_name = create_hash_attributes[:last_name]
    @first_name = create_hash_attributes[:first_name]
    @gender = create_hash_attributes[:gender]
    @favorite_color = create_hash_attributes[:favorite_color]
    @date_of_birth = create_hash_attributes[:date_of_birth]
  end

  def delimiter_splitter(data)
    if data.include?(",")
      data.split(",") 
    else
      data.split("|")
    end
  end

  def create_hash_attributes
    Hash[ARRAY.map(&:to_sym).zip(data)]
  end

end
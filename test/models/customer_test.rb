require "test_helper"

describe Customer do
  describe "relationships" do 
    it "has movies" do 
      # Arrange
      mariya = customers(:mariya)

      # Act
      mariya.movies 

      # Assert
      expect(mariya.movies).must_equal []

    end

    it "can checkout the movies" do 
    end
  end
  
  describe "validations" do 
    before do 
      @mariya = customers(:mariya)
    end 
    
    it "has a name" do 
      # Assert
      @mariya.name.must_equal "mariya"
    end
    
    it "will fail if it doesnt have a name" do
      bad_user = Customer.new(name: nil, address: "801 Dexter Ave", registered_at: Date.parse("Wed, 29 Apr 2015"), city: "Seattle", state: "WA", postal_code: "98116")
      
      expect(bad_user.valid?).must_equal false
    end
    
    it "has registered_at" do 
      # Assert
      @mariya.registered_at.wont_be_nil
    end
    
    it "will fail if it isnt registered" do
      bad_user = Customer.new(name: "Cloudy", address: "801 Dexter Ave", registered_at: nil, city: "Seattle", state: "WA", postal_code: "98116")
      
      expect(bad_user.valid?).must_equal false
    end
    
    it "has an address" do 
      @mariya.address.wont_be_nil
    end
    
    it "will fail if an address is not provided" do 
      bad_user = Customer.new(name: "Cloudy", address: nil, registered_at: Date.parse("Wed, 29 Apr 2015"), city: "Seattle", state: "WA", postal_code: "98116")
      
      expect(bad_user.valid?).must_equal false
    end
    
    it "has a city" do 
      @mariya.city.wont_be_nil
    end
    
    it "will fail if a city is not provided" do 
      bad_user = Customer.new(name: "Cloudy", address: "801 Dexter Ave", registered_at: Date.parse("Wed, 29 Apr 2015"), city: nil, state: "WA", postal_code: "98116")
      
      expect(bad_user.valid?).must_equal false
    end
    
    it "has a state" do 
      @mariya.state.wont_be_nil
    end
    
    it "will fail if a state is not provided" do
      bad_user = Customer.new(name: "Cloudy", address: "801 Dexter Ave", registered_at: Date.parse("Wed, 29 Apr 2015"), city: "Seattle", state: nil, postal_code: "98116")
      
      expect(bad_user.valid?).must_equal false
    end
    
    it "has a postal code" do 
      @mariya.postal_code.wont_be_nil
    end
    
    it "will fail if a zipcode is not provided" do
      bad_user = Customer.new(name: "Cloudy", address: "801 Dexter Ave", registered_at: Date.parse("Wed, 29 Apr 2015"), city: "Seattle", state: "WA", postal_code: nil)
      
      expect(bad_user.valid?).must_equal false
    end
    
    it "has a phone number" do 
      @mariya.phone.wont_be_nil
    end
    
    it "will fail if a phone number is not listed" do
      bad_user = Customer.new(name: "Cloudy", address: "801 Dexter Ave", registered_at: Date.parse("Wed, 29 Apr 2015"), city: nil, state: "WA", postal_code: "98116")
      
      expect(bad_user.valid?).must_equal false
    end
  end
end
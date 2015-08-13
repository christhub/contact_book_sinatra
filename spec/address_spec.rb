require('rspec')
require('address')
require('email')
require('contact')
require('phone')

describe(Address) do
  describe('#street') do
    it('will display the street and its number') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      expect(test_address.street()).to(eq("123 Main Street"))
    end
  end

  describe('#city') do
    it('will display the city name') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      expect(test_address.city()).to(eq("Cupertino"))
    end
  end

  describe('#state') do
    it('will return the state') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      expect(test_address.state()).to(eq("California"))
    end
  end

  describe('#zip') do
    it('will return the zip code') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      expect(test_address.zip()).to(eq("95014"))
    end
  end
end

require('rspec')
require('address')
require('email')
require('contact')
require('phone')

describe(Address) do

  before() do
    Address.clear()
  end
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

  describe('#save') do
    it('will save a address to an array') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      expect(test_address.save()).to(eq([test_address]))
    end
  end

  describe('.find') do
    it('will find an address based on the id') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      test_address.save
      expect(Address.find(1)).to(eq(test_address))
    end
  end

  describe('.clear') do
    it('will clear the address array') do
      test_address = Address.new({:street => "123 Main Street", :city =>"Cupertino", :state => "California", :zip => "95014"})
      test_address.save()
      Address.clear
      expect(Address.all()).to(eq([]))
    end
  end

  describe('.all') do
    it('will return an empty array') do
      expect(Address.all).to(eq([]))
    end
  end



end

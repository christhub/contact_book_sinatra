require('rspec')
require('contact')
require('phone')

describe(Phone) do

  describe('#number') do
    it('returns phone number') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      expect(test_phone.number()).to(eq(8675309))
    end
  end

  describe('#type') do
    it('returns phone type') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      expect(test_phone.type()).to(eq("cell"))
    end
  end

  describe('#id') do
    it('returns id number') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      expect(test_phone.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('returns an empty array') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('returns the saved array') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe('.clear') do
    it('returns the cleared array') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      expect(Phone.clear()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns the contact by id') do
      test_phone = Phone.new({:number => 8675309, :type => "cell"})
      test_phone.save
      expect(Phone.find(1)).to(eq(test_phone))
    end
  end

end

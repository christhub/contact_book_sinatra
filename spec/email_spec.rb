require('rspec')
require('contact')
require('phone')
require('email')

describe(Email) do

  before() do
    Email.clear()
  end

  describe('#email_address') do
    it('returns the email address') do
      test_email = Email.new({:email_address => "bob@bob.bob", :work => true})
      expect(test_email.email_address()).to(eq("bob@bob.bob"))
    end
  end

  describe('#work') do
    it('returns true if it is a work email address') do
      test_email = Email.new({:email_address => "bob@bob.bob", :work => true})
      expect(test_email.work()).to(eq(true))
    end
  end

  describe('.all') do
    it('returns an empty array by default') do
      test_email = Email.new({:email_address => "bob@bob.bob", :work => true})
      expect(Email.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns the email by its id') do
      test_email = Email.new({:email_address => "bob@bob.bob", :work => true})
      test_email.save
      expect(Email.find(1)).to(eq(test_email))
    end
  end

  describe('#save') do
    it('saves the email to the array of emails') do
      test_email = Email.new({:email_address => "bob@bob.bob", :work => true})
      test_email.save
      expect(Email.all()).to(eq([test_email]))
    end
  end

  describe('.clear') do
    it('clears out the array of saved emails') do
      test_email = Email.new({:email_address => "bob@bob.bob", :work => true})
      test_email.save
      Email.clear
      expect(Email.all()).to(eq([]))
    end
  end

end

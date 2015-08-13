require('rspec')
require('contact')

describe(Contact) do
  # before() do
  #   CD.clear()
  # end

  describe('#first_name') do
    it('returns the first name') do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Smith", :job_title => "CEO", :company => "McDonalds"})
      expect(test_contact.first_name()).to(eq("Bob"))
    end
  end

  describe('#last_name') do
    it('returns the last name') do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Smith", :job_title => "CEO", :company => "McDonalds"})
      expect(test_contact.last_name()).to(eq("Smith"))
    end
  end

  describe('#job_title') do
    it('returns the job title') do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Smith", :job_title => "CEO", :company => "McDonalds"})
      expect(test_contact.job_title()).to(eq("CEO"))
    end
  end

  describe('#company') do
    it('returns the company') do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Smith", :job_title => "CEO", :company => "McDonalds"})
      expect(test_contact.company()).to(eq("McDonalds"))
    end
  end

  describe('#phones') do
    it('returns the phone numbers of the contact') do
      test_contact = Contact.new({:first_name => "Bob", :last_name => "Smith", :job_title => "CEO", :company => "McDonalds"})
      expect(test_contact.phones()).to(eq([]))
    end
  end
end

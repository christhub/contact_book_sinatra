class Email

  @@emails = []

  attr_reader(:email_address, :work, :id)

  define_method(:initialize) do |attributes|
    @email_address = attributes.fetch(:email_address)
    @work          = attributes.fetch(:work)
    @id            = @@emails.length().+(1)
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_singleton_method(:clear) do
    @@emails = []
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:find) do |identifier|
    found_email = nil
    @@emails.each() do |email|
      if email.id() == identifier
        found_email = email
      end
    end
    found_email
  end

end

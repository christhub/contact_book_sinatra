class Address

  @@addresses = []

  attr_reader(:city, :state, :zip, :street, :id)

  define_method(:initialize) do |attributes|
    @city     = attributes.fetch(:city)
    @state    = attributes.fetch(:state)
    @zip      = attributes.fetch(:zip)
    @street   = attributes.fetch(:street)
    @id       = @@addresses.length().+(1)
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:find) do |identification|
    found_address = nil
    @@addresses.each() do |address|
      if address.id() == identification
        found_address = address
      end
    end
    found_address
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:all) do
    @@addresses
  end

end

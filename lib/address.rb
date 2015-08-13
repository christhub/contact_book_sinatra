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
end

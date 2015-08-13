require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/address')
require('./lib/email')
require('./lib/phone')

get('/') do
  erb(:index)
end

get('/contacts') do
  erb(:contacts_form)
end

get('/contacts/new') do
  @contacts = Contact.all()
  (:contacts)
end

post('/contacts') do
  name = params.fetch('name')
  Contact.new(name).save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end

get('/contacts/:id/addresses/new') do
  @contacts = Contact.find(params.fetch('id').to_i)
  erb(:contacts_addresses_form)
end

post('/addresses') do
  street  = params.fetch('street')
  city    = params.fetch('city')
  state   = params.fetch('state')
  zip     = params.fetch('zip')
  @address = Address.new(street, city, state, zip)
  @address.save()
  @contacts = Contact.find(params.fetch('id').to_i)
  @contacts.add_address(@address)
  erb(:contacts)
end

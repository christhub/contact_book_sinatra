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

get('/contacts/') do
  erb(:contacts)
end

get('/contacts/new/') do
  @contacts = Contact.all()
  erb(:contacts_form)
end


post('/contacts/') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  company = params.fetch('company')
  job_title = params.fetch('job_title')
  @contact = Contact.new({:first_name => first_name, :last_name => last_name, :company => company, :job_title => job_title})
  @contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end

get('/contacts/:id/addresses/new/') do
  @contacts = Contact.find(params.fetch('id').to_i)
  erb(:contact_addresses_form)
end

post('/addresses/') do
  street  = params.fetch('street')
  city    = params.fetch('city')
  state   = params.fetch('state')
  zip     = params.fetch('zip')
  @address = Address.new({:street => street, :city => city, :state => state, :zip => zip})
  @address.save()
  @contacts = Contact.find(params.fetch('id').to_i)
  @contacts.add_address(@address)
  erb(:contact)
end

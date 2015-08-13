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
  @contacts = Contact.all()
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
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact_addresses_form)
end

post('/addresses/') do
  street  = params.fetch('street')
  city    = params.fetch('city')
  state   = params.fetch('state')
  zip     = params.fetch('zip')
  @address = Address.new({:street => street, :city => city, :state => state, :zip => zip})
  @address.save()
  @contact = Contact.find(params.fetch('id').to_i)
  @contact.add_address(@address)
  erb(:contact)
end

get('/contacts/:id/phones/new/') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact_phone_form)
end

post('/phones/') do
  number    = params.fetch('phone_number')
  type      = params.fetch('phone_type')
  id_number = params.fetch('id')
  if type == "true"
    type = true
  else
    type = false
  end
  @phone = Phone.new({:number => number, :type => type})
  @phone.save()
  @contact = Contact.find(id_number.to_i())
  @contact.add_phone(@phone)
  redirect("/contacts/#{id_number}")
end

get('/contacts/:id/emails/new/') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact_email_form)
end

post('/emails/') do
  email_address = params.fetch('email_address')
  work          = params.fetch('work')
  id_number     = params.fetch('id')
  if work == "true"
    work = true
  else
    work = false
  end
  @email        = Email.new({:email_address => email_address, :work => work})
  @email.save
  @contact = Contact.find(id_number.to_i())
  @contact.add_email(@email)
  redirect("/contacts/#{id_number}")
end

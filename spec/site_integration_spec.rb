require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('when using the site to view all listing', {:type => :feature}) do

  it('should show all the contact entries') do
    visit('/')
    expect(page).to have_content('View Contact Book')
    expect(page).to have_content('Add a New Contact')
    click_link('View Contact Book')
    expect(page).to have_content('Contacts:')
  end

  it('should add a contact entry') do
    visit('/')
    click_link('Add a New Contact')
    fill_in('first_name', :with => 'John')
    fill_in('last_name',  :with => 'Smith')
    fill_in('company',    :with => 'NAACP')
    fill_in('job_title',  :with => 'President')
    click_button('Submit')
    expect(page).to have_content('John')
  end

  it('should allow the user to view on contact card') do
    visit('/contacts/')
    click_link('John')
    expect(page).to have_content('John Smith')
    click_link('Add Address')
    fill_in('street', :with => 'street')
    fill_in('city',   :with => 'city')
    fill_in('state',  :with => 'state')
    fill_in('zip',    :with => 'zip')
    click_button('Submit New Contact')
  end

  it('should allow the user to add a phone number') do
    visit('/contacts/')
    click_link('John')
    expect(page).to have_content('John Smith')
    click_link('Add Phone')
    fill_in('phone_number', :with => "5049349332")
    click_button('Submit Phone Number')
    expect(page).to have_content('5049349332')
  end

end

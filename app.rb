require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/phone_numbers')
require('./lib/email')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end


get('/contact_form') do
  erb(:contact_form)
end

post('/') do
  @all_contacts = Contact.all
  @contact_name = Contact.new({:last_name => params.fetch('last_name'), :first_name => params.fetch('first_name')})
  @contact_name.save
  erb(:index)
end

get('/contact_info/:id') do
  @contact_info = Contact.find(params.fetch("id").to_i)
  erb(:contact_info)
end

post('/contact_info/:id') do
  @all_contacts = Contact.all
  @contact_info = Contact.find(params.fetch("contact_info").to_i)
  @new_number = Phone.new({:area_code => params.fetch('area_code').to_i, :number => params.fetch('phone_number').to_i, :type => params.fetch('phone_type')})
  @new_number.save()
  @contact_info.add_phone(@new_number)
  # @phone = @contact_info.phone()
  erb(:contact_info)
end

get('/clear') do
  Contact.clear
  erb(:index)
end


get('/contact_clear') do
  Phone.clear
  erb(:contact_info)
end

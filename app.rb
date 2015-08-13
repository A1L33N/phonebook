require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/phone_numbers')
require('./lib/email')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end


get('/contact_form') do
  erb(:contact_form)
end

post('/') do
  @contact_name = Contact.new({:last_name => params.fetch('last_name'), :first_name => params.fetch('first_name')})
  @contact_name.save
  erb(:contact_form)
end

get('/contact_info/:id') do
  @contact_info = Contact.find(params.fetch("id").to_i)
  erb(:contact_info)
end

get('/clear') do
  Contact.clear
  erb(:index)
end

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact path', {type: :feature}) do
  it('allows user to add contact name') do
    visit('/')
    fill_in('last_name', with:'Gonzalez')
    fill_in('first_name', with:'David')
    click_button('Add Contact')
    expect(page).to have_content('Contact successfully added Return to Contact List')
  end

  it 'displays contact name info do' do
    visit('/contact_info')
    expect(page).to have_content('David Gonzalez')
  end

end

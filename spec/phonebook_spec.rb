require('rspec')
require('phonebook')
require('pry')

describe(Contact) do
  describe('#last_name') do
    it('returns contact last name') do
      test_contact = Contact.new({:last_name => 'Jackson', :first_name => 'Bob'})
      expect(test_contact.last_name()).to(eq('Jackson'))
    end
  end

  describe('.all') do
    it('it lists all saved contacts') do
      expect(Contact.all).to(eq([]))
    end
  end
end

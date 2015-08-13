require('rspec')
require('phonebook')
require('pry')

describe(Contact) do
  before do
    Contact.clear
  end
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

  describe('#save') do
    it('save a contact to the list of contacts') do
      test_contact = Contact.new({:last_name => 'Jackson', :first_name => 'Bob'})
      test_contact.save
      test_contact2 = Contact.new({:last_name => 'Doe', :first_name => 'John'})
      test_contact2.save
      expect(Contact.all).to eq([test_contact, test_contact2])

    end
  end

  describe('.clear') do
    it('clears all saved contacts') do
      expect(Contact.clear).to eq([])
    end
  end

  describe('#id') do
    it('assigns and id number to a contact') do
      test_contact = Contact.new({:last_name => 'Jackson', :first_name => 'Bob'})
      test_contact.save
      test_contact2 = Contact.new({:last_name => 'Doe', :first_name => 'John'})
      test_contact2.save
      expect(test_contact2.id).to eq (2)
    end
  end

  describe('.find') do
    it('finds a contact by id number') do
      test_contact = Contact.new({:last_name => 'Jackson', :first_name => 'Bob'})
      test_contact.save
      test_contact2 = Contact.new({:last_name => 'Doe', :first_name => 'John'})
      test_contact2.save
      expect(Contact.find(1)).to eq(test_contact)
    end
  end

  describe('#delete_contact') do
    it('deletes a contact from saved contacts') do
      test_contact = Contact.new({:last_name => 'Jackson', :first_name => 'Bob'})
      test_contact.save
      test_contact2 = Contact.new({:last_name => 'Doe', :first_name => 'John'})
      test_contact2.save
      test_contact3 = Contact.new({:last_name => 'Doe', :first_name => 'Jane'})
      test_contact3.save
      test_contact2.delete_contact
      expect(Contact.all).to eq [test_contact, test_contact3]
    end
  end
end

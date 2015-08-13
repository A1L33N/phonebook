class Contact
  attr_reader(:last_name, :first_name, :id, :phone_numbers, :emails, :addresses)
  @@all_contacts = []
  define_method(:initialize) do |attributes|
    @last_name = attributes.fetch(:last_name)
    @first_name = attributes.fetch(:first_name)
    @id = @@all_contacts.length.+(1)
    @phone_numbers = []
    @emails = []
    @addresses = []
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.id.eql?(identification.to_i)
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:delete_contact) do
    @@all_contacts.delete(self)
  end

  define_method(:add_phone) do |phone_number|
    @phone_numbers.push(phone_number)
  end

  define_method(:email) do |email|
    @emails.push(email)
  end

  define_method(:address) do |address|
    @addresses.push(address)
  end

end

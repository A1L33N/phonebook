class Contact
  attr_reader(:last_name, :first_name, :id)
  @@all_contacts = []
  define_method(:initialize) do |attributes|
    @last_name = attributes.fetch(:last_name)
    @first_name = attributes.fetch(:first_name)
    @id = @@all_contacts.length.+(1)
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


end

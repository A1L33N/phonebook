class Contact
  attr_reader(:last_name, :first_name)
  @@all_contacts = []
  define_method(:initialize) do |attributes|
    @last_name = attributes.fetch(:last_name)
    @first_name = attributes.fetch(:first_name)
  end

  define_singleton_method(:all) do
    @@all_contacts
  end
end

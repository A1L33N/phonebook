class Email
  attr_reader(:email, :type)
  @@all_emails = []
  define_method(:initialize) do |attributes|
    @email = attributes.fetch(:email)
    @type = attributes.fetch(:type)
  end

  define_singleton_method(:all) do
    @@all_emails
  end

  define_method(:save) do
    @@all_emails.push(self)
  end

  define_singleton_method(:clear) do
    @@all_emails=[]
  end
end

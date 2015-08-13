class Phone
  @@all_numbers = []
  attr_reader :area_code, :number, :type
  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)

  end

# binding.pry
  define_method(:complete_number) do
    @area_code.to_s + @number.to_s
  end

  define_singleton_method(:all) do
    @@all_numbers
  end

  define_method(:save) do
    @@all_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@all_numbers = []
  end

  define_method(:delete) do
    @@all_numbers.delete(self)
  end

end

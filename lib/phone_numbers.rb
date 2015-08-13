class Phone
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
end

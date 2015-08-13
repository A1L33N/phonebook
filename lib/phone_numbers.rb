class Phone
  attr_reader :area_code, :number
  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
  end

  define_method(:complete_number) do
    self
  end
end

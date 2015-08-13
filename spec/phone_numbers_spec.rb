require 'rspec'
require 'phone_numbers'
require 'pry'

describe Phone do
  describe('#complete_number') do
    it 'returns the full phone number' do
      test_number = Phone.new({:area_code => 210, :number => 1234567 })
      expect(test_number.complete_number).to eq(test_number)
    end
  end
end

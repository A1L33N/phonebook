require 'rspec'
require 'phone_numbers'
require 'pry'

describe Phone do
  describe('#complete_number') do
    it 'returns the full phone number' do
      test_number = Phone.new({:area_code => 210, :number => 1234567, :type=>'work'})
      expect(test_number.complete_number).to eq('2101234567')
    end
  end

  describe('#type') do
    it('returns the type of phone number') do
      test_number = Phone.new({:area_code => 210, :number => 1234567, :type => 'home'})
      expect(test_number.type).to eq('home')
    end
  end
end

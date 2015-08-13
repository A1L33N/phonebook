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

  describe('.all') do
    it('returns all saved numbers') do
      expect(Phone.all).to eq([])
    end
  end

  describe('#save') do
    it 'saves a number to a list of all numbers' do
      test_number = Phone.new({:area_code => 210, :number => 1234567, :type => 'home'})
      test_number.save
      test_number2 = Phone.new({:area_code => 210, :number => 3334444, :type => 'work'})
      test_number2.save
      expect(Phone.all).to eq ([test_number, test_number2])
    end
  end

  describe('.clear') do
    it 'clears all numbers from save numbers' do
      test_number = Phone.new({:area_code => 210, :number => 1234567, :type => 'home'})
      test_number.save
      test_number2 = Phone.new({:area_code => 210, :number => 3334444, :type => 'work'})
      test_number2.save
      Phone.clear
      expect(Phone.all).to eq([])
    end
  end

  describe('#delete') do
    it 'deletes a specific number from the saved numbers' do
      test_number = Phone.new({:area_code => 210, :number => 1234567, :type => 'home'})
      test_number.save
      test_number2 = Phone.new({:area_code => 210, :number => 3334444, :type => 'work'})
      test_number2.save
      test_number3 = Phone.new({:area_code => 210, :number => 2224444, :type => 'work'})
      test_number3.save
      test_number2.delete
      expect(Phone.all).to eq([test_number, test_number3])
    end
  end
end

require 'rspec'
require 'pry'
require 'email'

describe('Email') do
  describe('#type') do
    it('returns the type of email') do
      test_email=Email.new({:email => 'fakemail@gmail.com', :type => 'personal'})
      expect(test_email.type).to eq('personal')
    end
  end

  describe('#email') do
    it('returns the email address') do
      test_email=Email.new({:email => 'fakemail@gmail.com', :type => 'personal'})
      expect(test_email.email).to eq('fakemail@gmail.com')
    end
  end
end

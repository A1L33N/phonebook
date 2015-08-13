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

  describe('.all') do
    it('returns all of the saved email addresses') do
      expect(Email.all).to eq([])
    end
  end

  describe('#save') do
    it('saves emails to all emails array') do
      test_email = Email.new({:email => 'jimmy@yahoo.com', :type => 'work'})
      test_email.save
      expect(Email.all).to eq([test_email])
    end
  end

  describe('.clear') do
    it('clears saved emails array') do
      test_email = Email.new({:email => 'amanda@yahoo.com', :type => 'work'})
      Email.clear
      expect(Email.all).to eq([])
    end
  end
end

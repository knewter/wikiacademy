require 'minitest_helper'

describe Certificate do
  subject do
    Certificate.new name: 'Test', description: 'Foo'
  end

  describe "with valid attributes" do
    it "should be valid" do
      subject.valid?.must_equal true
    end
  end

  describe "without name" do
    it "should not be valid" do
      subject.name = nil
      subject.valid?.wont_equal true
    end
  end

  describe "without description" do
    it "should not be valid" do
      subject.description = nil
      subject.valid?.wont_equal true
    end
  end
end

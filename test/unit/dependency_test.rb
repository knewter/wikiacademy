require 'minitest_helper'

describe Dependency do
  subject do
    Dependency.new dependency_group_id: 1, child_id: 1
  end

  describe "with valid attributes" do
    it "should be valid" do
      subject.valid?.must_equal true
    end
  end

  describe "without dependency_group_id" do
    it "should not be valid" do
      subject.dependency_group_id = nil
      subject.valid?.wont_equal true
    end
  end

  describe "without child_id" do
    it "should not be valid" do
      subject.child_id = nil
      subject.valid?.wont_equal true
    end
  end
end

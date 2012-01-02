require 'minitest_helper'

describe DependencyGroup do
  subject do
    DependencyGroup.new dependency_type: 'single', parent_id: 1
  end

  describe "testing validity" do
    describe "with valid attributes" do
      it "should be valid" do
        subject.valid?.must_equal true
      end
    end

    describe "without dependency_type" do
      it "should not be valid" do
        subject.dependency_type = nil
        subject.valid?.wont_equal true
      end
    end

    describe "with invalid dependency_type" do
      it "should not be valid" do
        subject.dependency_type = 'giggity'
        subject.valid?.wont_equal true
      end
    end

    describe "without parent_id" do
      it "should not be valid" do
        subject.parent_id = nil
        subject.valid?.wont_equal true
      end
    end
  end

  describe "testing satisfaction" do
    describe "single" do
      describe "with all of its dependencies satisfied" do
        it "should be satisfied" do
          subject.dependency_type = 'single'
          subject.stubs(:dependency_ids).returns([1])
          subject.satisfied?([1]).must_equal true
        end
      end

      describe "with none of its dependencies satisfied" do
        it "should not be satisfied" do
          subject.dependency_type = 'single'
          subject.stubs(:dependency_ids).returns([1])
          subject.satisfied?([2]).must_equal false
        end
      end
    end

    describe "multiple" do
      describe "with enough of its dependencies satisfied" do
        it "should be satisfied" do
          subject.dependency_type = 'multiple'
          subject.number_required = 2
          subject.stubs(:dependency_ids).returns([1, 2, 3])
          subject.satisfied?([1, 2]).must_equal true
        end
      end

      describe "with too few of its dependencies satisfied" do
        it "should not be satisfied" do
          subject.dependency_type = 'multiple'
          subject.number_required = 2
          subject.stubs(:dependency_ids).returns([1, 2, 3])
          subject.satisfied?([2]).must_equal false
        end
      end
    end
  end
end

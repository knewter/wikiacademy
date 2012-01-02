class DependencyGroup < ActiveRecord::Base
  DEPENDENCY_TYPES = %w(single multiple)
  belongs_to :parent_certificate, class_name: 'Certificate', foreign_key: 'parent_id'
  has_many :dependencies

  validates_presence_of  :dependency_type
  validates_inclusion_of :dependency_type, in: DEPENDENCY_TYPES
  validates_presence_of  :parent_id
  validates_presence_of  :number_required, :if => :is_multiple?

  def dependency_ids
    dependencies.map(&:id)
  end

  def satisfied?(completed_dependency_ids)
    _num_required = is_single? ? 1 : number_required
    (dependency_ids - completed_dependency_ids).count < _num_required
  end

  protected
  def is_multiple?
    dependency_type == 'multiple'
  end

  def is_single?
    dependency_type == 'single'
  end
end

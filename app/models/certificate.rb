class Certificate < ActiveRecord::Base
  has_many :child_dependency_groups, :foreign_key => :parent_id
  has_many :parent_dependency_groups, :foreign_key => :child_id

  validates_presence_of :name
  validates_presence_of :description
end

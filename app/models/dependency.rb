class Dependency < ActiveRecord::Base
  belongs_to :dependency_group
  belongs_to :child_certificate, class_name: 'Certificate', foreign_key: 'child_id'

  validates_presence_of :dependency_group_id
  validates_presence_of :child_id
end

class Dependency < ActiveRecord::Base
  belongs_to :parent_certificate, :class_name => 'Certificate', :foreign_key => 'parent_id'
  belongs_to :child_certificate, :class_name => 'Certificate', :foreign_key => 'child_id'
end

class Certificate < ActiveRecord::Base
  has_many :child_dependencies, :foreign_key => :parent_id
  has_many :parent_dependencies, :foreign_key => :child_id
end

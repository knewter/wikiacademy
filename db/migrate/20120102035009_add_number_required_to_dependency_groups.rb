class AddNumberRequiredToDependencyGroups < ActiveRecord::Migration
  def change
    add_column :dependency_groups, :number_required, :integer
  end
end

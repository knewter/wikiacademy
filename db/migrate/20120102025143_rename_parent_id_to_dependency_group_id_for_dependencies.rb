class RenameParentIdToDependencyGroupIdForDependencies < ActiveRecord::Migration
  def change
    rename_column :dependencies, :parent_id, :dependency_group_id
  end
end

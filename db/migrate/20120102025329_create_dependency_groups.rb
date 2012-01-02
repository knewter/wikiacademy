class CreateDependencyGroups < ActiveRecord::Migration
  def change
    create_table :dependency_groups do |t|
      t.string :dependency_type
      t.integer :parent_id

      t.timestamps
    end
  end
end

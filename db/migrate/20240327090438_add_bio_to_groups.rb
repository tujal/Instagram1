class AddBioToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :bio, :text
  end
end

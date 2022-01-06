class AddAssignedToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :assigned, :string
  end
end

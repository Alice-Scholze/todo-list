class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :value
      t.string :type
      t.boolean :checked, default: false
      t.datetime :date

      t.timestamps
    end
  end
end

class CreateFosterParents < ActiveRecord::Migration
  def change
    create_table :foster_parents do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :animal_id

      t.timestamps
    end
  end
end

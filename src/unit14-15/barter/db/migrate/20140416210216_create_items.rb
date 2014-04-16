class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :image_url
      t.string :name
      t.text :description
      t.string :status
      t.string :condition

      t.timestamps
    end
  end
end

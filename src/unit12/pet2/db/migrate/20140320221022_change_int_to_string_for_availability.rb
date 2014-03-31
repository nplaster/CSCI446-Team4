class ChangeIntToStringForAvailability < ActiveRecord::Migration
  def change
		change_column :animals, :status_id, :string
  end
end

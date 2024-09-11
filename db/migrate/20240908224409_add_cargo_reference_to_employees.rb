class AddCargoReferenceToEmployees < ActiveRecord::Migration[7.2]
  def change
    remove_column :employees, :position, :string
    add_reference :employees, :positions, foreign_key: true
  end
end

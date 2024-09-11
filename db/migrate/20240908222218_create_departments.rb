class CreateDepartments < ActiveRecord::Migration[7.2]
  def change
    create_table :departments do |t|
      t.string :code
      t.string :name
      t.text :description
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end

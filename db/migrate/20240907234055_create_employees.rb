class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :birthdate
      t.string :gender
      t.string :cpf
      t.string :rg
      t.references :address, null: false, foreign_key: true
      t.string :phone
      t.string :email
      t.string :position
      t.date :hire_date
      t.decimal :salary
      t.string :status

      t.timestamps
    end
  end
end

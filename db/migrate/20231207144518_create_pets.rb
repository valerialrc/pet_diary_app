class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :birth_date
      t.string :sex
      t.string :specie
      t.string :breed
      t.decimal :weight

      t.timestamps
    end
  end
end

class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end

class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :company
      t.string :contact
      t.string :city
      t.string :state
      t.string :phone
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end

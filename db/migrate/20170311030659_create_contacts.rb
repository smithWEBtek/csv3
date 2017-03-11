class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :company_id, default: 0
      t.string :first_name
      t.string :last_name
      t.string :role
      t.text :about
      t.string :email
      t.string :phone
      t.string :linkedin
      t.string :twitter
      t.string :blog
      t.string :website

      t.timestamps
    end
  end
end

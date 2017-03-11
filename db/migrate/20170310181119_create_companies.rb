class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.text :about
      t.string :hr_email
      t.string :hr_phone
      t.string :hr_contact
      t.string :dev_contacts

      t.timestamps
    end
  end
end

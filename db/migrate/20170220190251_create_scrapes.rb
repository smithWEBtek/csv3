class CreateScrapes < ActiveRecord::Migration[5.0]
  def change
    create_table :scrapes do |t|
      t.string :url
      t.string :teacher_name
      t.string :teacher_phone
      t.string :teacher_email
      t.string :teacher_company
      t.string :teacher_website

      t.timestamps
    end
  end
end

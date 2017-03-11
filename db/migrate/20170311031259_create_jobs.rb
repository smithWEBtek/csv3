class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :company_id
      t.string :contact_id, default: 0
      t.text :instructions
      t.text :requirements
      t.integer :learning, default: 0
      t.integer :skills, default: 0
      t.integer :networking, default: 0
      t.integer :location, default: 0
      t.integer :salary, default: 0
    end
  end
end

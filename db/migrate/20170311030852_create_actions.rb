class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :act_type
      t.date :act_date
      t.text :act_result
      t.string :act_next
      t.date :act_next_due_date
      t.integer :contact_id, default: 0
      t.integer :company_id, default: 0
      t.integer :job_id, default: 0
      
      t.timestamps
    end
  end
end

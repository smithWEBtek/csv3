require 'csv'

csv_text = File.read('...')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Moulding.create!(row.to_hash)
end



      t.string :name
      t.string :company
      t.string :city
      t.string :state
      t.string :website
      t.string :email
      t.string :phone1
      t.string :phone2
      t.string :address1
      t.string :address2
      t.string :zip
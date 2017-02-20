require 'csv'

namespace :import do
  desc "Import teachers from csv"
  task teachers: :environment do 
    filename = File.join Rails.root, "./lib/assets/teachers.csv"
    CSV.foreach(filename, headers: true) do |row|
      company, contact, email, phone, city, state, website = row
      teacher_hash = {company: row[0], contact: row[1], email: row[2], phone: row[3], city: row[4], state: row[4], website: row[5]}
      if !Teacher.find_by(contact: row[1])
        teacher = Teacher.create(teacher_hash)
        puts Teacher.last.contact
      end
    end
  end
end

namespace :truncate do
  desc  "truncate Teachers table"
  task teachers: :environment do 
    Teacher.destroy_all
    ActiveRecord::Base.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='teachers'")
  end
end

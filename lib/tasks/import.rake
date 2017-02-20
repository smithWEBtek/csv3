require 'csv'

namespace :import do
  desc "Import teachers from csv"
  task teachers: :environment do 
    filename = File.join Rails.root, "teachers.csv"
    CSV.foreach(filename, headers: true) do |row|
      name, city, state, phone = row
      teacher_hash = {name: row[0], city: row[1], state: row[2], phone: row[3]}
      if !Teacher.find_by(name: row[0])
        teacher = Teacher.create(teacher_hash)
        puts Teacher.last.name
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

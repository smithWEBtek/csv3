require 'csv'

class Teacher < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def self.import
    filename = File.join Rails.root, "./lib/assets/teachers.csv"
    CSV.foreach(filename, headers: true) do |row|
      name, city, state, phone = row
      teacher_hash = {name: row[0], city: row[1], state: row[2], phone: row[3]}
      if !Teacher.find_by(name: row[0])
        teacher = Teacher.create(teacher_hash)
        puts Teacher.last.name
      end
    end
  end

  def self.truncate
    Teacher.destroy_all
    @connection = ActiveRecord::Base.connection
    @connection.exec_query( "UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='teachers'" )
  end
end
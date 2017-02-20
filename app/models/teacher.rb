require 'csv'

class Teacher < ApplicationRecord
  validates :contact, presence: true, uniqueness: true

  def self.import
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

  def self.truncate
    Teacher.destroy_all
    @connection = ActiveRecord::Base.connection
    @connection.exec_query( "UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='teachers'" )
  end
end
class Scrape < ApplicationRecord

  def self.scrape
    page = HTTParty.get('https://www.expertise.com/ma/boston/piano-lessons')
    parse_page = Nokogiri::HTML(page)
    teachers_array = []

    parse_page.css('.provider-card__info__header').each do |card|
      Teaccard.text
      # "provider-card__content"
      # "provider-card__info__header"

      # teacher_company_description = card.text
binding.pry
  end

end



      # t.string :company
      # t.string :contact
      # t.string :city
      # t.string :state
      # t.string :phone
      # t.string :website
      # t.string :email

class Scrape < ApplicationRecord

  def self.scrape
    page = HTTParty.get('https://www.expertise.com/ma/boston/piano-lessons')
    parse_page = Nokogiri::HTML(page)
    companies = []
    parse_page.css('.provider-card__info__header').each do |company_name|
      companies.push(company_name.text)
      new_scrape = Scrape.new(company: company_name.text)
      new_scrape.save
    end
    store_csv(companies)
  end

  def self.store_csv(array) 
    CSV.open('./lib/assets/scrape.csv', 'a') do |csv|
      csv << array
    end
  end

end
  
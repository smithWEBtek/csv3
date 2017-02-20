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
binding.pry
    store_csv(companies)
  end

  def self.store_csv(array) 
    CSV.open('./lib/assets/scrape.csv', 'w') do |csv|
      csv << array
    end
  end

end
 
 # "Boston, MA(857) 259-7717"

# company   parse_page.css('.provider-card__info__header').text  
# about     parse_page.css('.provider-card__content').first.text
# contact
# city      parse_page.css('.provider-card__icon.provider-card__icon__location').first.text
# state

          # [36] pry(Scrape)> d=_
          # [37] pry(Scrape)> parse_page.css('.provider-card__icon.provider-card__icon__location').first.text
          # [37] pry(Scrape)> parse_page.css('.provider-card__icon.provider-card__icon__location').first.text
          # => "Boston, MA"
          # [38] pry(Scrape)> z = _
          # => "Boston, MA"
          # [39] pry(Scrape)> z.split(",")[1]
          # => " MA"
          # [40] pry(Scrape)> z.split(", ")[1]
          # => "MA"
          # [41] pry(Scrape)> z.split(", ")[0]
          # => "Boston"


# phone     a = parse_page.css('.provider-card__info__line').split("(")[1]
#           a = .split("(")[1]
# website   parse_page.css('provider-card__icon provider-card__icon__website').first.text
# email


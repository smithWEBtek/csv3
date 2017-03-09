class Scrape < ApplicationRecord
 
  def self.scrapePianoTeacher
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




  def self.scrapePianoTeacher
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

  def self.scrape2
    page = HTTParty.get('https://boston.craigslist.org/search/aap')
    parse_page = Nokogiri::HTML(page)
    parse_page.css('.result-row')
binding.pry

    # title:        parse_page.css('.result-title').first.text
    # price:        parse_page.css('.result-price').first.text
    # heading:      parse_page.css('.result-row')
    # neighborhood: parse_page.css('.result-hood').first.text

######### schema from legalhousing site ################# 
    # t.datetime "listed_at"
    # t.string   "address"
    # t.decimal  "latitude",       precision: 10, scale: 6
    # t.decimal  "longitude",      precision: 10, scale: 6
    # t.string   "heading"
    # t.string   "description"
    # t.boolean  "discriminatory"
    # t.datetime "created_at",                              null: false
    # t.datetime "updated_at",                              null: false
#######################################################################
  listings = []
  #     {
  # price: parse_page.css('.result-price').text,
  # heading: parse_page.css('.result-row')


  end

  def self.store_csv(array) 
    CSV.open('./lib/assets/scrape.csv', 'a') do |csv|
      csv << array
    end
  end

end
  
class Scrape < ApplicationRecord
  def self.new_companies(url_scrape = 'https://clutch.co/developers/ruby-rails')
    page = HTTParty.get(url_scrape)
    @parse_page = Nokogiri::HTML(page)
    devcos = []
    companies = @parse_page.css('.company-name a')

    companies.each_with_index do |company, i|
      company_name = company.text
      url = @parse_page.css('.website-link a')[i]['href']
      company = {
        name: company_name.strip,
        url: url
      }
      devcos.push(company)
    end
    Company.import(devcos)
    if !@parse_page.css('.pager-next a').empty?
      url_next 
    else
    end
  end

  def self.url_next
    @url_prefix = 'https://clutch.co/'
    @url_suffix = @parse_page.css('.pager-next a')[0]['href']
    new_companies(@url_prefix + @url_suffix)
  end
end

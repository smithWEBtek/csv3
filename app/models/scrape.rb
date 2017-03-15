class Scrape < ApplicationRecord
  def self.new_companies(url_scrape = 'https://clutch.co/developers/ruby-rails')
    page = HTTParty.get(url_scrape)
    @doc = Nokogiri::HTML(page)
    devcos = []
    companies = @doc.css('.company-name a')
    companies.each_with_index do |co, i|
      company = {
        name: co.text.strip,
        url: @doc.css('.website-link a')[i]['href']
      }
    devcos.push(company)
    end
    city_state_country_phone(devcos)
  end

  def self.url_next
    @url_prefix = 'https://clutch.co/'
    @url_suffix = @doc.css('.pager-next a')[0]['href']
    new_companies(@url_prefix + @url_suffix)
  end

  def city_state_country_phone(devcos)
    devcos_detailed = []
    devcos.each do |company|
      url = "https://clutch.co/profile/" + company.name
      page = HTTParty.get(url)
      doc = Nokogiri::HTML(page)


binding.pry

    company = {
      city:  doc.css('span.locality')[i].text,
      state: doc.css('span.region')[i].text,
      country: doc.css('span.country-name')[i].text,
      phone: doc.css('')
      }
    devcos_detailed.push(company)
    end
      Company.import(company)
    if !@doc.css('.pager-next a').empty?
      url_next
    else
    end
  end

end

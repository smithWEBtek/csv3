class AddCountryToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :country, :string
  end
end

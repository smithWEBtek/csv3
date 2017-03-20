class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(:name)
    render json: @companies
  end

  def show
    @company = Company.find_by_id(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:message] = 'Company created.'
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find_by_id(params[:id])
  end

  def update
    @company = Company.find_by_id(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:message] = 'Company updated.'
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find_by_id(params[:id])
    @company.destroy
    redirect_to root_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :about, :city, :state, :url, :employees, :revenue, :age)
  end
end

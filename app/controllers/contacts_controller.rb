class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(:name)
  end

  def show
    @contact = Contact.find_by_id(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:message] = 'Contact created.'
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find_by_id(params[:id])
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    @contact.update(contact_params)
    if @contact.save
      flash[:message] = 'Contact updated.'
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])
    @contact.destroy
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :role, :about, :email, :phone, :linkedin, :twitter, :blog, :website)
  end
end
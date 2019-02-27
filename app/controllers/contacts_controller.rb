class ContactsController < ApplicationController
  def index
    @contacts = Contacts.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create 
    @contact = Contact.new(contact_params)
    @contact = Contact.new
    if (@contact.save)
      redirect_to
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update 
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
    redirect_to contacts_path
    else
      render :edit
    end

  def destroy
    @contact = Contact.find(params[:id])
  end

  private 
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end

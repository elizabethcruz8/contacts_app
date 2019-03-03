class Api::ContactsController < ApplicationController
  def index 
    @contacts = Contact.all
    render "index.json.jbuilder"
  end 

  def create
    @contact= Contact.new(
      first_name = params[:body_first_name],
      last_name = params[:body_last_name],
      email = params[:body_email], 
      phone_number = params[:body_phone_number])
    @contact.save 
    render "show.json.jbuilder"
  end

  def show 
    @contact = Contact.all.find_by(id: params[:id])
    render "show.json.jbuilder"
  end 

  def update
    @contact = Contact.find_by(id:params[:id])
    @contact.first_name = params[:body_first_name] || @contact.first_name 
    @contact.last_name = params[:body_last_name] || @contact.last_name 
    @contact.email = params[:body_email] || @contact.email
    @contact.phone_number = params[:body_phone_number] || @contact.phone_number 
    @contact.save
    render "show.json.jbuilder"
  end 

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy 
    render json: {message:"Contact succesfully destroyed!"}
  end 
end

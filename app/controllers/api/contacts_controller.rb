class Api::ContactsController < ApplicationController
  def index 
    if current_user 
      @contacts = current_user.contacts 

      search_terms = params["search"]
      if search_terms
        @contacts = @contacts.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE?" , "%#{search_terms}%","%#{search_terms}%", "%#{search_terms}%") #one field to search multiple things 
      end 
      @contacts = @contacts.order(:id)
      render "index.json.jbuilder"
    else 
      render json: []
    end
  end  



  def create
    @contact = Contact.new(
      first_name: params[:body_first_name],
      middle_name: params[:body_middle_name],
      last_name: params[:body_last_name],
      email: params[:body_email], 
      bio: params[:body_bio],
      phone_number: params[:body_phone_number],
      user_id: current_user.id
      )
    if @contact.save 
      render "show.json.jbuilder"
    else 
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def show 
    @contact = Contact.all.find_by(id: params[:id])
    render "show.json.jbuilder"
  end 

  def update
    @contact = Contact.find_by(id:params[:id])
    @contact.first_name = params[:body_first_name] || @contact.first_name 
    @contact.middle_name = params[:body_middle_name] || @contact.middle_name 
    @contact.last_name = params[:body_last_name] || @contact.last_name 
    @contact.email = params[:body_email] || @contact.email
    @contact.bio = params[:body_bio] || @contact.bio
    @contact.phone_number = params[:body_phone_number] || @contact.phone_number 
    if @contact.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end 

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy 
    render json: {message:"Contact succesfully destroyed!"}
  end 
end

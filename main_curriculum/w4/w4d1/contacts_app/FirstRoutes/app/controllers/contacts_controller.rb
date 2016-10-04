class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    all_contacts = user.contacts + user.shared_contacts
    render json: all_contacts
  end

  def show
    @contact_to_show = Contact.find(params[:id])
    render json: @contact_to_show
  end

  def create
    @new_contact = Contact.new(contact_params)
    if @new_contact.save!
      render json: @new_contact
    else
      render(
        json: @new_contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    @contact_to_update = Contact.find(params[:id])
    if @contact_to_update.update!(contact_params)
      render json: @contact_to_update
    else
      render(
        json: @contact_to_update.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact_to_destroy = Contact.find(params[:id])
    if @contact_to_destroy.destroy!
      render json: Contact.all
    else
      render(
        json: @contact_to_destroy.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end

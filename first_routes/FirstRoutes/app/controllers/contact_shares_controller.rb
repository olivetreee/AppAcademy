class ContactSharesController < ApplicationController
  def create
    new_share = ContactShare.new(share_params)
    if new_share.save
      render json: new_share
    else
      render(
        json: new_share.errors.full_messages, status: :not_valid_pair
      )
    end
  end

  def destroy
    share_to_destroy = ContactShare.find(params[:id])
    if share_to_destroy.destroy
      render json: ContactShare.all
    else
      render(
        json: share_to_destroy.errors.full_messages, status: :not_able_to_destroy
      )
    end
  end

  private
  def share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end

require 'byebug'
class NotesController < ApplicationController

  def create
    @new_note = Note.new(note_params)
    @new_note.user_id = current_user.id
    if @new_note.valid?
      @new_note.save!
    else
      flash.now[:errors] = @new_note.errors.full_messages
    end
    redirect_to track_url(@new_note.track)
  end

  def destroy
    note_to_delete = Note.find(params[:id])
    track = note_to_delete.track
    if current_user == note_to_delete.user
      note_to_delete.destroy
      redirect_to track_url(track)
    else
      render status: "forbidden", text: "Not your note, dummy"
    end
  end


  private

  def note_params
    params.require(:note).permit(:content, :user_id, :track_id)
  end

end

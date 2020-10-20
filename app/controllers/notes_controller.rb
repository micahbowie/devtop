class NotesController < ApplicationController

  def index
    redirect_if_not_logged_in
    @notes = Note.all.order("created_at DESC")
  end

  def new
    redirect_if_not_logged_in
    @note = Note.new

  end

  def create
    redirect_if_not_logged_in
    @note = Note.new(note_params)
    # @note.user_id = User.find_by(:username => session[:username]).id

    if @note.save
      redirect_to @note
    else
      render 'new'
      # raise "it worked".inspect
    end
  end

  def show
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
  end

  def update
    redirect_if_not_logged_in
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end

  end

  def edit
    redirect_if_not_logged_in
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end


  private

    def note_params
      params.require(:note).permit(:title, :content)
    end
end

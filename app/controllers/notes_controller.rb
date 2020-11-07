class NotesController < ApplicationController

  def index
    redirect_if_not_logged_in
     @current_user_notes = current_user.notes.order("created_at DESC")
     @user = current_user.username
     @greeting = dynamic_welcome
  end

  def new
    redirect_if_not_logged_in
    @note = Note.new

  end

  def create
    redirect_if_not_logged_in
    @note = Note.new(note_params)
    @note.user_id = User.find_by(:username => session[:username]).id

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
      params.permit(:title, :content)
    end

    def authenticate_user_of_note
      @author_of_note = Note.find(params[:id]).user_id
      if current_user.id != @author_of_note
        redirect_to error_path
      end
    end

    def dynamic_welcome
      greeting = ['Jot it down!', 'Sshhhh Your notes are sleeping!', 'Note it.', 'You are about to forget hurry!']
      @dynamic_welcome = greeting.sample(1).join(', ')
    end

end

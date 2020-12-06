class NotesController < ApplicationController
before_action :redirect_if_not_logged_in
before_action :authenticate_user_of_note, except: [:new, :create, :index]
before_action :find_note, only: [:show, :edit, :update, :destroy]
layout "note-layout"

  def index
     @current_user_notes = current_user.notes.order("created_at DESC")
     @user = current_user.username
     dynamic_welcome
     if @current_user_notes.empty? == true
       render "no_notes"
     end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = User.find_by(:username => session[:username]).id
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      redirect_to '/notes'
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to :notes
  end


  private

    def note_params
      params.permit(:title, :content)
    end

    def authenticate_user_of_note
      @author_of_note = Note.find(params[:id]).user_id
      if current_user.id != @author_of_note
        redirect_to :error
      end
    end

    def dynamic_welcome
      greeting = ['Jot it down!', 'Sshhhh Your notes are sleeping!', 'Note it.', 'You are about to forget hurry!']
      @dynamic_welcome = greeting.sample(1).join(', ')
    end

    def find_note
      @note = Note.find(params[:id])
    end

end

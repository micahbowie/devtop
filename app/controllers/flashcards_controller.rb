class FlashcardsController < ApplicationController

  def new
    redirect_if_not_logged_in
    @card = Flashcard.new
  end

  def create
    redirect_if_not_logged_in
    @card = Flashcard.new
    @card.front = params[:front]
    @card.back = params[:back]
    @card.user_id = User.find_by(:username => session[:username]).id

    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end

  def show
    redirect_if_not_logged_in
    authenticate_user_of_flashcard
    @card = Flashcard.find(params[:id])
  end

  def index
    redirect_if_not_logged_in
    @greeting = dynamic_welcome
    @current_user_flashcards = current_user.flashcards.order("created_at DESC")
  end

  def update
    authenticate_user_of_flashcard
    @card = Flashcard.find(params[:id])
    @card.front = params[:front]
    @card.back = params[:back]

    if @card.save
      redirect_to @card
    else
      render 'edit'
    end
  end

  def edit
    redirect_if_not_logged_in
    authenticate_user_of_flashcard
    @card = Flashcard.find(params[:id])
  end


  def destroy
    @card = Flashcard.find(params[:id])
    @card.destroy

    redirect_to flashcards_path
  end

  private

  def authenticate_user_of_flashcard
    @author_of_flashcard = Flashcard.find(params[:id]).user_id
    if current_user.id != @author_of_flashcard
      redirect_to error_path
    end
  end

  def dynamic_welcome
    greeting = ['Wow flashcards...Way to go!', 'Sshhhh Your flashcards are sleeping!', "At least you won't lose these flashcards" , "Look at that.it's study o'clock"]
    @dynamic_welcome = greeting.sample(1).join(', ')
  end
end
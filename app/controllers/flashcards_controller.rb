class FlashcardsController < ApplicationController
before_action :redirect_if_not_logged_in
before_action :authenticate_user_of_flashcard, except: [:new, :create, :index]

  def new
    @card = Flashcard.new
  end

  def create
    @card = Flashcard.new(question_params)
    @card.user_id = User.find_by(:username => session[:username]).id
    if @card.save
      redirect_to @card, notice: "Take a look at your new flashcard!"
    else
      render 'new'
    end
  end

  def show
    @card = Flashcard.find(params[:id])
  end

  def index
    @greeting = dynamic_welcome
    @current_user_flashcards = current_user.flashcards.order("created_at DESC")
  end

  def update
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
    @card = Flashcard.find(params[:id])
  end


  def destroy
    @card = Flashcard.find(params[:id])
    @card.destroy
    redirect_to :flashcards
  end

  private

  def authenticate_user_of_flashcard
    @author_of_flashcard = Flashcard.find(params[:id]).user_id
    if current_user.id != @author_of_flashcard
      redirect_to :flashcards
    end
  end

  def dynamic_welcome
    greeting = ['Wow flashcards...Way to go!', 'Sshhhh Your flashcards are sleeping!', "At least you won't lose these flashcards" , "Look at that. It's study o'clock"]
    @dynamic_welcome = greeting.sample(1).join(', ')
  end

  def flashcard_params
    params.permit(:front, :back)
  end

end

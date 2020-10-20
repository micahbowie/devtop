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

    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end

  def show
    redirect_if_not_logged_in
    @card = Flashcard.find(params[:id])
  end

  def index
    redirect_if_not_logged_in
    @cards = Flashcard.all.order("created_at DESC")
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
    redirect_if_not_logged_in
    @card = Flashcard.find(params[:id])
  end


  def destroy
    @card = Flashcard.find(params[:id])
    @card.destroy

    redirect_to flashcards_path
  end


end

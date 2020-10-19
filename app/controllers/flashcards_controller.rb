class FlashcardsController < ApplicationController

  def new
    @card = Flashcard.new
  end

  def create
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
    @card = Flashcard.find(params[:id])
  end

  def index
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
    @card = Flashcard.find(params[:id])
  end


  def destroy
    @card = Flashcard.find(params[:id])
    @card.destroy

    redirect_to flashcards_path
  end


end

class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end
  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      redirect_to drink_path(@drink), notice: "注文承りました"
    else
      render :new, alert: "もう一度お伺いしてもいいですか", status: :unprocessable_entity
    end
  end
  def index
    @drinks = Drink.all
  end
  def show
  end

  def destroy
    Drink.destroy_all
    redirect_to root_path, notice: "ご来店ありがとうございました"
  end
  private
  def drink_params
    params.require(:drink).permit(:name)
  end
end

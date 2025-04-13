class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end
  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      redirect_to drinks_path, notice: "注文承りました"
    else
      render :new, alert: "もう一度お伺いしてもいいですか", status: :unprocessable_entity
    end
  end
  def index
  end
  def show
  end

  private
  def drink_params
    params.require(:drink).permit(:name)
  end
end

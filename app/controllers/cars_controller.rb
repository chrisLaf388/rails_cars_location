class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create, :car_params]

  def index
    @cars = Car.all
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find("1")
    @car.user = @user
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render 'edit'
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @user = User.find("1")
    @car.user = @user
    if @car.save!
      redirect_to car_path(@car)
    else
      render 'new'
    end
  end

  def destroy
    @car.destroy
    @car.save
    redirect_to cars_path
  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :category, :horse_power, :price_per_day, :transmision, :energy, :year_circulation, :city)
  end

end

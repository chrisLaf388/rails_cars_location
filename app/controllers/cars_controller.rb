class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create, :car_params, :category]

  def index
    @cars = policy_scope(Car).order(updated_at: :desc)
  end

  def show
    authorize @car
  end

  def edit
    authorize @car
  end

  def update
    authorize @car
    @user = current_user
    @car.user = @user
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render 'edit'
    end
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    @user = current_user
    @car.user = @user
    authorize @car
    if @car.save!
      redirect_to car_path(@car)
    else
      render 'new'
    end
  end

  def destroy
    authorize @car
    @car.destroy
    @car.save
    redirect_to cars_path
  end

  def category
    @cars = Car.where(category: params[:category])
    authorize @cars
  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :category, :horse_power, :price_per_day, :transmision, :energy, :year_circulation, :city, :photo)
  end

end

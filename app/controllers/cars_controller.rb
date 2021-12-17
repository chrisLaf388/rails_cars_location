class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create, :car_params, :category]

  def index
    # if params.keys == ["controller", "action"]
      #  @cars = Car.all
    if params["query"].present?
      @cars = Car.search_by_name_and_category_city(params["query"])
    elsif params["name"].present?
      @cars = policy_scope(Car).order(updated_at: :desc)
      @cars = @cars.search_by_name(params["name"]) unless params["name"].empty?
      @cars = @cars.search_by_category(params["category"]) unless params["category"].empty?
      @cars = @cars.search_by_transmision(params["transmision"]) unless params["transmision"].empty?
      @cars = @cars.search_by_energy(params["energy"]) unless params["energy"].empty?
      @cars = @cars.search_by_city(params["city"]) unless params["city"].empty?
    else
      @cars = policy_scope(Car).order(updated_at: :desc)
    end

    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: car.photo.key,
        price: car.price_per_day
      }
    end
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
    if @car.save
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

  def filtering_params
    # params.permit(:name, "category", "energy", :city, :max_price, "transmision")
    # return {
    #   category: params["category"],
    #   name: params["name"],
    #   energy: params["energy"],
    #   city: params["city"],
    #   max_price: params["max_price"],
    #   transmision: params["transmision"]
    # }
  end
end

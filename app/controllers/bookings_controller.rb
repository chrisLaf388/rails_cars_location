class BookingsController < ApplicationController
  def new
    # mettre recup current user + @car
    @car = Car.find(params["format"])
    @booking = Booking.new(user_id: current_user.id, car_id: @car.id)
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @car = Car.find(booking_params['car_id'].to_i)
    @car.user = @user
    authorize @booking
    if @booking.save!
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(status: false)
      redirect_to dashboard_path
      flash[:message] = "You Decline this book!"
    else
      redirect_to dashboard_path
      flash[:message] = "ERROR!"
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(status: true)
      redirect_to dashboard_path
      flash[:message] = "You Accepted this book!"
    else
      redirect_to dashboard_path
      flash[:message] = "ERROR!"
    end
  end



  private

  def booking_params
    params.require(:booking).permit(:car_id, :user_id, :start_at, :end_at, :total_price)
  end
end

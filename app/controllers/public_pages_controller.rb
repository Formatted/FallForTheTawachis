class PublicPagesController < ApplicationController
  def index

    #define session id
    session[:customer_id] = '1'

    @customer = Customer.find(session[:customer_id])
    session[:customer_name]  = @customer.name
    if params[:public_id]
      @reservation = Reservation.where(public_id: params[:public_id]).first
      @reservation.party_size = @reservation.party_size.to_i
    else
      @reservation = Reservation.new
      if params[:love]

        if modulo(params[:love].to_i / 147) == 0
          @reservation.party_size = params[:love].to_i / 147
        end
      else
        @reservation.party_size = 1
      end
    end
    @reservation.party_size.times do
      @reservation.persons.build
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = session[:customer_id]
    @reservation.is_confirmed = true
    @reservation.public_id = SecureRandom.urlsafe_base64
    set_reservation_name(@reservation)
    respond_to do |format|
      if @reservation.save
        format.html{ redirect_to :back }
        format.js{ }
        format.json{ render json: @reservation, status: :created, location: @reservation}
      else
        format.html { render action: 'index' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @reservation = Reservation.where(public_id: params[:public_id]).first
    @reservation.is_confirmed = true
    respond_to do |format|
      if @reservation.update_attributes(reservation_params)
        format.html{ redirect_to :back }
        format.js{ }
        format.json{ render json: @reservation, status: :created, location: @reservation}
      else
        format.html { render action: 'index' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:id, :name, :customer_id, :party_size, :address, :city, :state, :zip, persons_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.party_size.to_i > 1
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
    else
      reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
    end
  end

end
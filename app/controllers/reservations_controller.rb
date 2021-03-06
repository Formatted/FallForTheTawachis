class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :email, :update, :reset_email, :switch_attending, :switch_confirmed]

  def new
    @reservation = Reservation.new
    6.times do
      @reservation.persons.build
    end
  end

  def edit
    size = 6 - @reservation.party_size.to_i
    size.times do
      @reservation.persons.build
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = session[:customer_id]
    @reservation.persons.each do |person|
      person.customer_id = session[:customer_id]
    end
    @reservation.public_id = SecureRandom.urlsafe_base64
    @reservation.is_confirmed = false
    @reservation.email_sent = false
    set_reservation_name(@reservation)
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def index
    @reservations = Reservation.where(customer_id: session[:customer_id]).order(:name)
    confirmed = 0
    unconfirmed = 0
    @reservations.each do |reservation|
      unless reservation.not_attending
        if reservation.is_confirmed
          confirmed = confirmed + reservation.party_size
        else
          unconfirmed = unconfirmed + reservation.party_size
        end
      end
    end
    @attendees = [confirmed, unconfirmed]
  end

  def show
  end

  def update
    @reservation.persons.each do |person|
      person.customer_id = @reservation.customer_id
    end
    if @reservation.update_attributes(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    deleted_reservation = @reservation.name
    if @reservation.destroy
      redirect_to reservations_path, notice: "#{deleted_reservation} was successfully deleted."
    end
  end

  def email
    customer = Customer.find(session[:customer_id])
    email = customer.current_invitation
    Mailer.reservation_email(@reservation, email).deliver_now
    @reservation.update_columns(email_sent: true)
    redirect_to reservations_path
  end

  def reset_email
    @reservation.update_columns(email_sent: false)
    redirect_to reservations_path
  end

  def switch_attending
    if @reservation.not_attending
      @reservation.update_columns(not_attending: false)
    else
      @reservation.update_columns(not_attending: true, is_confirmed: false)
    end
    redirect_to :back
  end

  def switch_confirmed
    if @reservation.is_confirmed
      @reservation.update_columns(is_confirmed: false)
    else
      @reservation.update_columns(is_confirmed: true)
    end
    redirect_to :back
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
    if @reservation.customer_id != session[:customer_id]
      @reservation = nil
      redirect_to login_path
    end
  end

  def reservation_params
    params.require(:reservation).permit(:id, :not_attending, :name, :email, :customer_id, :party_size, :address, :city, :state, :zip, :group_id, :custom_name, persons_attributes: [:id, :first_name, :last_name, :meal_id])
  end

  def set_reservation_name(reservation)
    if reservation.name.nil? || reservation.name.blank?
      if reservation.persons.first.nil?
        reservation.name = 'Unnamed Group'
      else
        if reservation.party_size.to_i > 1
          reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name} and company"
        else
          reservation.name = "#{reservation.persons.first.first_name} #{reservation.persons.first.last_name}"
        end
      end
    end
  end

  def get_confirmed_amount(reservations)
    confirmed = 0
    unconfirmed = 0
    reservations.each do |reservation|
      if reservation.is_confirmed
        confirmed = confirmed + reservation.party_size
      else
        unconfirmed = unconfirmed + reservation
      end
    end
    Array.new(confirmed, unconfirmed)
  end


end

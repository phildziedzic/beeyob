class LocationsController < ApplicationController
  before_action :restrict_access, only: [:new, :edit]  
  before_action :load_location, only: [:edit, :show, :update]

  def index
    @locations = Location.search_for(params[:q])
  end

  def create
    @location = Location.create(safe_params)
    @location.user = current_user
    @location.save
    flash[:success] = "Location Successfully Added"
    redirect_to location_path(@location.id)
  end

  def new
    @location = Location.new
  end

  def update
    @location = Location.find(params[:id])
      if @location.update safe_params
        flash.now[:notice] = "Location Updated!"
        redirect_to location_path(@location.id)
      else
        flash.now[:notice] = "Location was not saved. Check your connection and try again!"
        redirect_to edit_location_path(@location.id)
      end
  end

  def edit
    @location = Location.find(params[:id])
    if @location.nil?
      redirect_to root_path
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private
    def safe_params
      params.require('location').permit(:name, :lat, :long, :address, :address2, :city, :state, :zip, :phone, :byob)
    end

    def load_location
      @location = Location.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash.now[:notice] = "Invalid Location #{params[:id]}"
      redirect_to root_path
    end    

    def restrict_access
      redirect_to login_path if @current_user.nil?
    end
end

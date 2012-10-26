class PropertiesController < ApplicationController
  before_filter :signed_in_user

  def index
    if signed_in?
    @property = current_user.properties.build
    @property_items = current_user.property_feed
    end
  end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.build(params[:property])
    if @property.save
	flash[:Success] = 'Your property has been created.'
	redirect_to root_path
    else
	@property_items = []
	render 'static_pages/home'
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to root_path
  end
end

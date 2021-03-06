class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_offices
  
  def get_offices
    @offices = Office.all
  end
  
  def get_office
    @office = Office.find_by_permalink(params[:office])
    redirect_to(index_path("stockholm")) unless @office
  end
end

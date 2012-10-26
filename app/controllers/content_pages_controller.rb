class ContentPagesController < ApplicationController
 

  def home
    if signed_in?
    @property = current_user.properties.build
    @property_items = current_user.property_feed
    end
  end

  def help
  end

  def questions
  end
end

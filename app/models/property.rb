class Property < ActiveRecord::Base
       	attr_accessible :address1, :address2, :city, :country, :desiredmonthlyrent, :emgcontact, :maxtenantoccupancy, :numberofbathrooms, :numberofbedrooms, :postcode, :propertytype, :squarefootage
belongs_to :user

validates :user_id, presence: true

validates :address1, presence: true

default_scope order: 'properties.created_at DESC'
end

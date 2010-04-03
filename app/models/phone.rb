class Phone < ActiveRecord::Base
  attr_accessible :name, :phone

  belongs_to :bussiness_card, :class_name => "BCard", :foreign_key => "contact_id"
end
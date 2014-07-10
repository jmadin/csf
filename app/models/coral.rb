class Coral < ActiveRecord::Base

  validates :location, :presence => true
  validates :exposure, :presence => true
  validates :image_id, :presence => true


  scope :located, lambda {|loc| where("location = ?", loc)}
  scope :exposed, lambda {|exp| where("exposure = ?", exp)}
  scope :gformed, lambda {|gfo| where("growth_form = ?", gfo)}

end

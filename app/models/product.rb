class Product < ActiveRecord::Base

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	
  	attr_accessor :remove_avatar

  	before_save :delete_avatar, if: ->{ remove_avatar == '1' && !avatar_updated_at_changed? }
     private
   def delete_avatar
    self.avatar = nil
  end

end

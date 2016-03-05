class Asset < ActiveRecord::Base
  belongs_to :vehicle
  
    has_attached_file :image, styles: { large: "450x350>", medium: "350x300>", 
                                      thumb: "100x100#" }, default_url: "/images/style/quePic.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end

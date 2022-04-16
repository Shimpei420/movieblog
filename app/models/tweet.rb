class Tweet < ApplicationRecord
    belongs_to :user
    has_many :comments
    mount_uploader :image, ImageUploader
    
  def self.search(keyword)
    if keyword != ""
     Tweet.where(["title like(?) OR story like(?)", "%#{keyword}%", "%#{keyword}%"])
    else
     Tweet.all.includes(:user).order("updated_at DESC")
    end
   end
  end

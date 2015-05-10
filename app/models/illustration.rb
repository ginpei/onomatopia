class Illustration < ActiveRecord::Base
  belongs_to :onomatope
  mount_uploader :image, IllustrationUploader
end

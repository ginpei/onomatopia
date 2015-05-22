class Illustration < ActiveRecord::Base
  belongs_to :onomatopoeia
  mount_uploader :image, IllustrationUploader
end

class Illustration < ActiveRecord::Base
  mount_uploader :image, IllustrationUploader
end

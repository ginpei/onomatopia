CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: Rails.application.secrets.awd_region
    }
  else
    config.storage = :file
  end

  config.fog_directory = Rails.application.secrets.awd_directory
end

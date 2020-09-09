CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AKIAYGQZTTHYN7IOJHK5"],
      aws_secret_access_key: ENV["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"],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = ENV['rails-blog-iamge']
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/rails-blog-iamge'
  end
end
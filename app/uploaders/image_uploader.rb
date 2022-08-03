class ImageUploader < CarrierWave::Uploader::Base
  # include Cloudinary::CarrierWave
  storage :file
  # process :convert => 'png' # 画像の保存形式
  # process :tags => ['image'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）

  # process :resize_to_limit => [100, 100] # 任意でリサイズの制限

  # # 保存する画像の種類をサイズ別に設定
  # version :standard do
  #   process :resize_to_fill => [100, 150, :north]
  # end

  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # def public_id
  #   return "local_test_cloudinary/" + Cloudinary::Utils.random_public_id;
  # end

  #　「storage :file」　が有効になっているとCloudinaryに画像アップロードできない　↓

  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog
end

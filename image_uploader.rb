def image_upload(img)
  logger.info "upload now"
  tempfile = img[:tempfile]
  # puts tempfile.path
  upload = Cloudinary::Uploader.upload(tempfile.path)

  post = Post.last

  post.update_attribute(:image_url, upload['url'])
end

def music_upload(img)
  logger.info "upload now"
  tempfile = img[:tempfile]
  # puts tempfile.path
  upload = Cloudinary::Uploader.upload(tempfile.path, options={ resource_type: "video" })

  post = Post.last

  post.update_attribute(:music_url, upload['url'])
end

def image_upload_local(img)
  if img
    contents = Contribution.last
    id = contents.id
    logger.info img
    ext = File.extname(img[:filename])
    img_name = "#{id}-bbs#{ext}"
    p "="*20
    logger.info ext
    img_path = "/images/bbs/#{img_name}"
    contents.update_attribute(:icon_url, img_path)

    save_path = File.join('public', 'images', 'bbs', img_name)

    File.open(save_path, 'wb') do |f|
     logger.info "Temp file: #{img[:tempfile]}"
     f.write img[:tempfile].read
     logger.info 'アップロード成功'
    end
  else
    logger.info 'アップロード失敗'
  end
end

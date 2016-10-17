class Webcam < ActiveRecord::Base
  has_attached_file :image, PaperclipStorage[:webcams]

  Paperclip.interpolates :camera do |attachment, style|
    image = attachment.instance
    "#{image.camera}"
  end

  Paperclip.interpolates :image_file_name do |attachment, style|
    image = attachment.instance
    "#{image.image_file_name}"
  end

  def authenticated_s3_get_url(options = {})
    options.reverse_merge!(expires: 10.minutes)

    bucket = AWS::S3::Bucket.new(image.options[:bucket])

    s3 = AWS::S3::S3Object.new(bucket, image.path)
    s3.url_for(:get, options).to_s
  end

  def error_messages
    messages = self.errors.messages.collect do |attr, msg|
      "#{attr.to_s.humanize} #{msg.first}"
    end
    messages.join(", ")
  end
end

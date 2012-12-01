require 'open-uri'

class ImageDownloader
  @queue = :images
  def self.perform(uri, fname)
    data = URI.parse(uri).read
    File.open(Rails.public_path + "/#{fname}", "wb") do |f|
      f.write data
    end
  end
end

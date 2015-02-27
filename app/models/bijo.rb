class Bijo < ActiveRecord::Base
  has_many :images

  def update_crawled_at(datetime)
    update_attribute(:crawled_at, datetime)
  end

  def return_urls
    urls = []
    image_arry = images.offset(rand(images.count)).limit(10)
    image_arry.each do |img|
      urls << img['url']
    end

    urls
  end
end

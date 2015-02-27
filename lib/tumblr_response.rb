class TumblrResponse
  def initialize(response)
    @response = response
  end

  def sorted_desc_by_datetime
    @response.sort do |a, b|
      a['date'] <=> b['date']
    end
  end

  def last_post
    sorted_desc_by_datetime[@response.size - 1]
  end

  def last_post_datetime
    p 'ラスト' + last_post['date']
    last_post['date']
  end

  def photos
    photo_arry = []
    @response.each do |res|
      next unless res['type'] == 'photo'
      res['photos'].each do |ph|
        photo_arry << ph
      end
    end

    photo_arry
  end

  def urls
    urls = []
    photos.each do |photo|
      urls << photo['original_size']['url']
    end

    urls
  end
end

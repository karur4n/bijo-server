class RedisClient
  def initialize
    @name_set ||= Redis::Set.new('bijo_name')
  end

  def add_name(name)
    @name_set << name
    p "#{@name_set} ------------------ this is reddddddddddddddddddddddddddddddddiiiiiiiiiiiiiiiiiiiiiiis"
  end
end

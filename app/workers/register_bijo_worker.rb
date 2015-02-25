class RegisterBijoWorker
  include Sidekiq::Worker

  def perform(name)
    p "#{name} register しましたよ"
    now_datetime = DateTime.now
    Bijo.create(name: name, referenced_at: now_datetime)
  end
end

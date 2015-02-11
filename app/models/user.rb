class User < ActiveRecord::Base
	has_many :twittertexts
  # Remember to create a migration!

  def delete_tweets!
    self.twittertexts.destroy_all
  end

  def fetch_tweets!
   $client.user_timeline(self.username, :count => 10).each do |x|
      self.twittertexts.create(text: x.text, time: x.created_at, link: x.uri)
    end

  end

  def tweets_stale?
    ((Time.now.to_i - self.twittertexts.last.created_at.to_i)/ 60) > 15 ? true : false
  end


end


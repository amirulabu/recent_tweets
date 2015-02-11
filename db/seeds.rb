testuser = User.create(username: "amirulabu")


$client.user_timeline(testuser.username, :count => 10).each do |x|
  testuser.twittertexts.create(text: x.text, time: x.created_at, link: x.uri)
end
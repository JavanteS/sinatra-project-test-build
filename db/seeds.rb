3.times do 
    user = User.create(username: Faker::Internet.username, email: Faker::Internet.safe_email, password: Faker::Internet.password)
    3.times do 
        user.games.create(title: Faker::Game.title, genre: Faker::Game.genre, platform: Faker::Game.platform)
    end
end

require 'open-uri'
require 'nokogiri'
require 'faker'

females = ["Doralynne Mcwhirte","Ronni Gangopadhyay","Letta Sande","Mil Cogman","Cecil Shanahan","Judye Norfleet","Liana Martin","Tamra Paone","Celestyn Stock","Willy Eickenhorst","Christan March","Ondrea Legates","Petunia Than","Ashleigh Callihan","Gerrie Morales","Morgan Cicone","Janis Fontana","Etheline Gurse","Arlyn Mcmeeking","Antonina Kademan","Willabella Macleod","Bernelle Callahan","Judi Gogan","Roch Chiang","Kelsey Keynes","Francine Jander","Tildi Newell","Gennie Mcintire","Eda Torok","Kiley Ferrandino","Elissa Nisbet","Phil Kertis","Malia Elliott","Luelle Brenig","Seline Sviokla","Adrea Thielst","Denys Sharples","Janella Liman","Alisun Endicott", "Damara Casserres"]
males=["Murdoch Nickoloff","Milty Lovejoy","Dietrich Carmichael","Lodovico Piessens","Demetrius Van","Hubie Archer","Jocko Siphron","Adriano Culhane","Cristiano Obermeyer","Rodge Maccormick","Thor Yong","Mathian Allebach","Derk Maller","Clemmy Tribbett","Darryl Mitten","Waylon Correia","Locke Gozzi","Garik Finau","Guthry Shanks","Baird Shirazi","Parke Ceniceros","Raynor Bergstrom","Falito Gauthier","Yancy Prokopow","Manfred Gibor","Flemming Blodgett","Renault Rasanen","Teddie Lemon","Curtis Conrad","Tymon Colnago","Patten Ge","Garald Wels","Gregory Laidler","Kareem Fowler","Peder Glebus","Aleksandr Beal","Giffie Cleary","Filmer Mcpherson","Warde Gorton","Mike Carlson"]
dates = ['1986-03-17','1986-04-07','1986-05-16','1987-06-02','1987-09-22','1988-02-04','1988-04-08','1988-08-11','1988-10-07','1989-02-06','1989-07-28','1990-01-23','1991-03-08','1991-05-03','1992-01-02','1992-04-22','1992-05-08','1992-06-18','1992-08-28','1992-11-10','1993-03-05','1993-05-10','1993-12-03','1994-03-02','1994-03-17','1986-03-17','1986-04-07','1986-05-16','1987-06-02','1987-09-22','1988-02-04']
dates.map! { |date| Date.parse(date)}

doc = Nokogiri::HTML(File.open('db/dates.html'))
blurbs = []
doc.search('p').map { |par|  blurbs.push(par.inner_text) if par.inner_text.length > 300}

quirks = ["Picks Nose","Nevernude","Left-handed", "Semi-professional Kazoo Player","Allergic to milk", "Speaks fluent pig-latin", "Don't cut my toenails", "I shower monthly", "I spend all my time on my favorite app, Shitter", "I spend all my money on Shitter emojis", "I pick fights with people bigger than me", "I like bumblebees more than turtles and ospreys", " I can't use a spoon", "I drink coffee", "I like music", "I'm an alcoholic", "I used to be a crack-whore"]
counter = 0


40.times do
  User.create(first_name: females[counter].split[0] , last_name: females[counter].split[1], email: Faker::Internet.safe_email(females[counter].split[0]), password_digest: Faker::Internet.password, birthday: dates.sample, picture:"http://api.randomuser.me/portraits/women/#{counter}.jpg", quirk: quirks.sample, gender: "female", bio: blurbs.sample, preference: ['LGBTQ','straight','other'].sample, date_count: 0)
  counter += 1
end
counter = 0
40.times do
  User.create(first_name: males[counter].split[0] , last_name: males[counter].split[1], email: Faker::Internet.safe_email(males[counter].split[0]), password_digest: Faker::Internet.password, birthday: dates.sample, picture:"http://api.randomuser.me/portraits/men/#{counter}.jpg", quirk: quirks.sample, gender: "male", bio: blurbs.sample, preference: ['LGBTQ','straight','other'].sample, date_count: 0)
  counter += 1
end

30.times do
  FutureBachelorette.create(user_id: User.all.sample.id, status: "closed")
end

10.times do
  FutureBachelorette.create(user_id: User.all.sample.id, status: "open")
end






#########################  USERS  #########################
users = ["Rick Sanchez", "Morty Smith", "Beth Sanchez", "Summer Smith", "Homer Simpson", "Lisa Simpson"]

users.each do |user|
    username = user.split(" ").join.downcase
    email = username + "@wooops.com"
    User.create(
        full_name: user,
        username: username,
        email: email,
        password: '123'
    )
end



puts "The seeeeeeeds are done"
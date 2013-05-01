User.create(username: "sean", password:"viewsonic")
User.create(username: 'pat', password: "password")
Post.create(title: "title", content:"a whole bunch of shit", user_id: 1)
Post.create(title: "anothertitle", content:"a whole bunch of shit", user_id: 2)
Comment.create(content:"a whoas dflkajsdf", user_id: 1, post_id: 2)
Comment.create(content:"a whoas dflasdfasdfskajsdf", user_id: 2, post_id: 1)


u1 = User.create!(email: "eric.olivetree@gmail.com", password: "minhabunda")
u2 = User.create!(email: "marisqb@gmail.com", password: "bundadela")
u3 = User.create!(email: "bla", password: "asdasdasd")

b1 = Band.create!(name: "John Mayer")
b2 = Band.create!(name: "U2")
b3 = Band.create!(name: "Eric Clapton")
b3 = Band.create!(name: "Nirvana")

a1 = Album.create!(name: "Born and Raised", band_id: 1, album_type: "studio")
a2 = Album.create!(name: "All That You Can't Leave Behind", band_id: 2, album_type: "studio")
a3 = Album.create!(name: "One More Car, One More Rider", band_id: 3, album_type: "live")
a4 = Album.create!(name: "Best of Nirvana", band_id: 4, album_type: "mixed")
a5 = Album.create!(name: "Unplugged", band_id: 3, album_type: "live")

n1 = Note.create!(content:"Bla bla bla bla bla bl bla bla", track_id: 1, user_id: 3)

t1 = Track.create!(position: 1, name: "Beautiful Day", album_id: 2, track_type: "regular")
t2 = Track.create!(position: 2, name: "Stuck in a Moment You Can't Get Out Of", album_id: 2, track_type: "regular")
t3 = Track.create!(position: 3, name: "Elevation", album_id: 2, track_type: "regular")
t4 = Track.create!(position: 4, name: "Walk On", album_id: 2, track_type: "regular")
t5 = Track.create!(position: 5, name: "Kite", album_id: 2, track_type: "regular")
t6 = Track.create!(position: 6, name: "In a Little While", album_id: 2, track_type: "regular")
t7 = Track.create!(position: 7, name: "Wild Honey", album_id: 2, track_type: "regular")
t8 = Track.create!(position: 8, name: "Peace on Earth", album_id: 2, track_type: "regular")
t9 = Track.create!(position: 9, name: "When I Look at the World", album_id: 2, track_type: "regular")
t10 = Track.create!(position: 10, name: "New York", album_id: 2, track_type: "regular")
t11 = Track.create!(position: 11, name: "Grace", album_id: 2, track_type: "regular")
t12 = Track.create!(position: 12, name: "The Ground Beneath Her Feet", album_id: 2, track_type: "bonus")
t13 = Track.create!(position: 1, name: "Queen of California", album_id: 1, track_type: "regular")
t14 = Track.create!(position: 2, name: "The Age of Worry", album_id: 1, track_type: "regular")
t15 = Track.create!(position: 3, name: "Shadow Days", album_id: 1, track_type: "regular")
t16 = Track.create!(position: 4, name: "Speak for Me", album_id: 1, track_type: "regular")
t17 = Track.create!(position: 5, name: "Something Like Olivia", album_id: 1, track_type: "regular")
t18 = Track.create!(position: 6, name: "Born and Raised", album_id: 1, track_type: "regular")
t19 = Track.create!(position: 7, name: "If I Ever Get Around to Living", album_id: 1, track_type: "regular")
t20 = Track.create!(position: 8, name: "Love Is a Verb", album_id: 1, track_type: "regular")
t21 = Track.create!(position: 9, name: "Walt Grace's Submarine Test, January 1967", album_id: 1, track_type: "regular")
t22 = Track.create!(position: 10, name: "Whiskey, Whiskey, Whiskey", album_id: 1, track_type: "regular")
t23 = Track.create!(position: 11, name: "A Face to Call Home", album_id: 1, track_type: "regular")
t24 = Track.create!(position: 12, name: "Born and Raised (Reprise)", album_id: 1, track_type: "regular")
t25 = Track.create!(position: 13, name: "Fool to Love You (Bonus Track)", album_id: 1, track_type: "bonus")
t26 = Track.create!(position: 1, name: "Key to the Highway", album_id: 3, track_type: "regular")
t27 = Track.create!(position: 2, name: "Reptile", album_id: 3, track_type: "regular")
t28 = Track.create!(position: 3, name: "Got You on My Mind", album_id: 3, track_type: "regular")
t29 = Track.create!(position: 4, name: "Tears in Heaven", album_id: 3, track_type: "regular")
t30 = Track.create!(position: 5, name: "Bell Bottom Blues", album_id: 3, track_type: "regular")
t31 = Track.create!(position: 6, name: "Change the World", album_id: 3, track_type: "regular")
t32 = Track.create!(position: 7, name: "My Father's Eyes", album_id: 3, track_type: "regular")
t33 = Track.create!(position: 8, name: "River of Tears", album_id: 3, track_type: "regular")
t34 = Track.create!(position: 9, name: "Going Down Slow", album_id: 3, track_type: "regular")
t35 = Track.create!(position: 10, name: "She's Gone", album_id: 3, track_type: "regular")
t36 = Track.create!(position: 11, name: "I Want a Little Girl", album_id: 3, track_type: "regular")
t37 = Track.create!(position: 12, name: "Badge", album_id: 3, track_type: "regular")
t38 = Track.create!(position: 13, name: "Hoochie Coochie Man", album_id: 3, track_type: "regular")
t39 = Track.create!(position: 14, name: "Have You Ever Loved a Woman", album_id: 3, track_type: "regular")
t40 = Track.create!(position: 15, name: "Cocaine", album_id: 3, track_type: "regular")
t41 = Track.create!(position: 16, name: "Wonderful Tonight", album_id: 3, track_type: "regular")
t42 = Track.create!(position: 17, name: "Layla", album_id: 3, track_type: "regular")
t43 = Track.create!(position: 18, name: "Sunshine of Your Love", album_id: 3, track_type: "regular")
t44 = Track.create!(position: 19, name: "Over the Rainbow", album_id: 3, track_type: "regular")
t45 = Track.create!(position: 1, name: "About A Girl", album_id: 4, track_type: "regular")
t46 = Track.create!(position: 2, name: "Been A Son", album_id: 4, track_type: "regular")
t47 = Track.create!(position: 3, name: "Sliver", album_id: 4, track_type: "regular")
t48 = Track.create!(position: 4, name: "Smells Like Teen Spirit", album_id: 4, track_type: "regular")
t49 = Track.create!(position: 5, name: "Come As You Are", album_id: 4, track_type: "regular")
t50 = Track.create!(position: 6, name: "Lithium", album_id: 4, track_type: "regular")
t51 = Track.create!(position: 7, name: "In Bloom", album_id: 4, track_type: "regular")
t52 = Track.create!(position: 8, name: "Heart Shaped Box", album_id: 4, track_type: "regular")
t53 = Track.create!(position: 9, name: "Pennyroyal Tea", album_id: 4, track_type: "regular")
t54 = Track.create!(position: 10, name: "Rape Me", album_id: 4, track_type: "regular")
t55 = Track.create!(position: 11, name: "Dumb", album_id: 4, track_type: "regular")
t56 = Track.create!(position: 12, name: "All Apologies", album_id: 4, track_type: "regular")
t57 = Track.create!(position: 13, name: "The Man Who Sold The World", album_id: 4, track_type: "regular")
t58 = Track.create!(position: 1, name: "Signe", album_id: 5, track_type: "regular")
t59 = Track.create!(position: 2, name: "Before You Accuse Me", album_id: 5, track_type: "regular")
t60 = Track.create!(position: 3, name: "Hey Hey", album_id: 5, track_type: "regular")
t61 = Track.create!(position: 4, name: "Tears in Heaven", album_id: 5, track_type: "regular")
t62 = Track.create!(position: 5, name: "Lonely Stranger", album_id: 5, track_type: "regular")
t63 = Track.create!(position: 6, name: "Nobody Knows You When You're Down and Out", album_id: 5, track_type: "regular")
t64 = Track.create!(position: 7, name: "Layla", album_id: 5, track_type: "regular")
t65 = Track.create!(position: 8, name: "Running on Faith", album_id: 5, track_type: "regular")
t66 = Track.create!(position: 9, name: "Walkin' Blues", album_id: 5, track_type: "regular")
t67 = Track.create!(position: 10, name: "Alberta", album_id: 5, track_type: "regular")
t68 = Track.create!(position: 11, name: "San Francisco Bay Blues", album_id: 5, track_type: "regular")
t69 = Track.create!(position: 12, name: "Malted Milk", album_id: 5, track_type: "regular")
t70 = Track.create!(position: 13, name: "Old Love", album_id: 5, track_type: "regular")
t71 = Track.create!(position: 14, name: "Rollin' and Tumblin'", album_id: 5, track_type: "regular")
t72 = Track.create!(position: 15, name: "My Father's Eyes", album_id: 5, track_type: "bonus")
t73 = Track.create!(position: 16, name: "Circus Left Town", album_id: 5, track_type: "bonus")
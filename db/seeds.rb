# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




# BEFORE SEEDING!!
# - go to facebook for developers site and take a look at all the test users we have set up (note their emails)
# - to add the users to the dev db, log them in on fb by coping their emails (told you the password)
# - log each of them into the site (localhost or heroku)
# - they should be in the db now
# - rake db:seed to get the rest of the tables filled in







Photo.create([	
				{caption:"Outside Le Louvre!",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Da%20Vinci%20Code%20-%20The%20Pyramid%20Louvre%20-%20Fan%20Photo_zpsgixesmtr.jpg",visit_id:1}
				{caption:"The Blue Door #nottinghill",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Notting%20Hill%20-%20The%20Blue%20Door%20280%20Westbourne%20Park%20Rd%20-%20William%20Thackers%20Flat%20-%20Fan%20Photo_zpsy1aggfjc.jpg",visit_id:44},
				{caption:"WOP BAM BOOM! Outside Rydell High #grease",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Grease%20-%20Venice%20High%20School%20-%20Rydell%20High%20in%20Grease%20-%20Fan%20Photo_zpswsj5gobx.jpg",visit_id:47},
				{caption:"#pontdebirhakeim #inception",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Inception%20-%20Pont%20De%20Bir-Hakeim%20Paris%20-%20Where%20Ariadne%20recreates%20a%20dream%20version%20-%20Fan%20Photo_zpsksnhio8k.jpg",visit_id:48},
				{caption:"Lost in Translation",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Lost%20in%20Translation%20-%20fan%20photo_zpslmydhrbh.jpeg",visit_id:43},
				{caption:"Say hello to my little friend!",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Scarface%20-%20chainsaw%20-%20fan%20photo_zpsznv1neu5.png",visit_id:24},
				{caption:"Outside Carrie Bradshaw's apartment",image_file_name:"https://www.flordemariafashion.com/wp-content/uploads/2014/05/IMG_92212.jpg",visit_id:3},
				{caption:"Beach from the Notebook",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Notebook%20-%20beach%20-%20fan%20photo_zpssotomz3v.jpeg",visit_id:37},
				{caption:"The house in the Notebook",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Notebook%20-%20Noahs%20House%20-%20fan%20photo_zpschrzdjag.jpeg",visit_id:36},
				{caption:"#avengers",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/The%20Avengers%20-%20fan%20photo_zpsu74utoyv.jpeg",visit_id:8},
				{caption:"Gotham, take control! Take control of your city. This... this is the instrument of your liberation!",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Dark%20Knight%20rises%20-%20bridge%20-%20fan%20photo_zpsxlkfx2pp.jpeg",visit_id:6},
				{caption:"GODFATHER CORLEONE COMPOUND",image_file_name:"http://i.dailymail.co.uk/i/pix/2014/11/13/1415878241017_wps_4_They_re_waiting_for_an_of.jpg",visit_id:34},
				{caption:"#thegodfather #church",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Godfather%20-%20church%20-%20fan%20photo_zps5g1gofv4.jpeg",visit_id:35},
				{caption:"The house that was in the Royal Tenenbaums",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/The%20Royal%20Tenenbaums%20-%20fan%20photo_zpsfahfehh0.jpeg",visit_id:16},
				{caption:"Just outside Wayne Manor!",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Dark%20Knight%20rises%20-%20wayne%20manor%20-%20fan%20photo_zpsrg40phop.jpeg",visit_id:7},
				{caption:"You show me a pay stub for $72,000, I quit my job right now and work for you.",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Wolf%20of%20Wall%20Street%20-%20meeting%20Donnie%20-%20fan%20photo_zps4bndkuz3.jpeg",visit_id:12},
				{caption:"#wolfofwallstreet",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Wolf%20of%20Wall%20Street%20-%20bay%20boat%20-%20fan%20photo_zps12iuqyja.jpeg",visit_id:11},
				{caption:"Anyone fancy some Breakfast at Tiffany's?",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Breakfast%20at%20Tiffanys%20-%20fan%20photo_zps0eqhxc4j.jpeg",visit_id:31},
				{caption:"When Harry dropped off Sally",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/When%20Harry%20Met%20Sally%20-%20dropping%20off%20-%20fan%20photo_zpsk3h7y8wu.jpeg",visit_id:13},
				{caption:"Stood outside Zoolander's apartment",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Zoolander%20-%20fan%20photo_zps23yztgm1.jpeg",visit_id:10},
				{caption:"#lockstocktwosmokingbarrels #hideout",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Lock%20Stock%20and%20Two%20Smoking%20Barrels%20-%20Park%20Street%20-%20Fan%20Photo_zpsamduo0zk.jpg",visit_id:45},
				{caption:"Where Ethan sat in Mission Impossible",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Mission%20Impossible%20-%20Anchor%20Tavern%20London%20-%20Ethan%20unwinds%20after%20chase%20-%20Fan%20Photo_zpszo4yjmx2.jpg",visit_id:50},
				{caption:"Outside MI6 #skyfall",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Skyfall%20-%20Vauxhall%20Cross%20Westminster%20Bridge%20-%20M%20watches%20the%20attack%20on%20MI6%20HQ%20-%20Fan%20Photo_zpsskrvmogs.jpg",visit_id:46},
				{caption:"Snatch - Doug the Head's local pub",image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Fan%20photos/Snatch%20-%20Ye%20Olde%20Pub%20-%20Fan%20Photo_zpsuzrud9sg.jpg",visit_id:49}
	])

# Photo table:
# id | caption | created_at | updated_at | visit_id | image_file_name | image_content_type | image_file_size | image_updated_at 










# TO BE SEEDED AGAIN... AS FINAL SEED
Movie.create([
				{name:"The Da Vinci Code",imdbID:"tt0382625"},
				{name:"Grease",imdbID:"tt0077631"},
				{name:"Inception",imdbID:"tt1375666"},
				{name:"Lost In Translation",imdbID:"tt0335266"},
				{name:"Amelie",imdbID:"tt0211915"},
				{name:"Attack on Titan",imdbID:"tt2072230"},
				{name:"On Her Majesty's Secret Service",imdbID:"tt0064757"},
				{name:"Breakfast at Tiffany's",imdbID:"tt0054698"},
				{name:"The Graduate",imdbID:"tt0061722"},
				{name:"The Sound of Music",imdbID:"tt0059742"},
				{name:"Ghostbusters",imdbID:"tt0087332"},
				{name:"Sex and the City",imdbID:"tt1000774"},
				{name:"Indiana Jones and the Last Crusade",imdbID:"tt0097576"},
				{name:"The Dark Knight",imdbID:"tt0468569"},
				{name:"The Dark Knight Rises",imdbID:"tt1345836"},
				{name:"The Godfather",imdbID:"tt0068646"},
				{name:"Scarface",imdbID:"tt0086250"},
				{name:"Manhatten",imdbID:"tt0079522"},
				{name:"Notting Hill",imdbID:"tt0125439"},
				{name:"Lock Stock and Two Smoking Barrels",imdbID:"tt0120735"},
				{name:"Madagascar",imdbID:"tt0351283"},
				{name:"Snatch",imdbID:"tt0208092"},
				{name:"The Avengers",imdbID:"tt0848228"},
				{name:"Zoolander",imdbID:"tt0196229"},
				{name:"Live and Let Die",imdbID:"tt0070328"},
				{name:"The Wolf of Wall Street",imdbID:"tt0993846"},
				{name:"When Harry Met Sally",imdbID:"tt0098635"},
				{name:"Superman",imdbID:"tt0078346"},
				{name:"The Royal Tennenbaums",imdbID:"tt0265666"},
				{name:"Raging Bull",imdbID:"tt0081398"},
				{name:"Night at the Museum",imdbID:"tt2692250"},
				{name:"Men In Black",imdbID:"tt0127385"},
				{name:"Rocky",imdbID:"tt0075148"},
				{name:"Home Alone",imdbID:"tt0099785"},
				{name:"The Italian Job",imdbID:"tt0317740"},
				{name:"Goodfellas",imdbID:"tt0099685"},
				{name:"The Notebook",imdbID:"tt0332280"},
				{name:"Goldeneye",imdbID:"tt0113189"},
				{name:"The Fox and the Hound",imdbID:"tt0082406"},
				{name:"Die Hard",imdbID:"tt0095016"},
				{name:"Skyfall",imdbID:"tt107463"},
				{name:"Mission Impossible",imdbID:"tt0117060"}
	])








# Movie:
# id | imdbID | name 





Location.create([ 
				{user_id:1,name:"", description:"Da Vinci Code", latitude:48.860000000000000000,longitude:2.341111100000034600,address:"Louvre Pyramid, 75001, Paris, France"},
				{user_id:2,name:"", description:"The Graduate", latitude:34.108903100000000000,longitude:-117.767457900000010000,address:"3205 D St, La Verne, CA 91750, United States"},
				{user_id:3,name:"", description:"Sex and the City", latitude:40.7353013,longitude:-74.0049664,address:"66 Perry Street and Bleecker Street, Manhattan"},
				{user_id:4,name:"", description:"Indiana Jones and the Last Crusade", latitude:45.4330526,longitude:12.32498720000001,address:"Campo San Barnabas, Venice Italy"},
				{user_id:5,name:"", description:"The Dark Knight", latitude:51.5097737,longitude:-0.1340399000000616,address:"Criterion Restaurant Piccadilly, 224 Piccadilly, London W1J 9HP"},
				{user_id:6,name:"", description:"The Dark Knight Rises", latitude:40.761555500000000000,longitude:-73.966592300000000000,address:"Queensboro Bridge, East 59th Street, New York"},
				{user_id:1,name:"", description:"The Dark Knight Rises", latitude:52.95190359999999,longitude:-1.2245035999999345,address:"Wollaton Hall & Deer Park, Nottingham NG8 2AE"},
				{user_id:2,name:"", description:"The Avengers", latitude:40.752998000000000000,longitude:-73.977056000000000000,address:"Park Avenue (near to Grand Central Terminal) Manhattan."},
				{user_id:3,name:"", description:"Live and Let Die", latitude:40.7829867,longitude:-73.94810960000001,address:"2nd Avenue and East 94th Street, Manhattan"},
				{user_id:4,name:"", description:"Zoolander", latitude:40.7238016,longitude:-74.00037600000002,address:"80 Greene Street and Spring Street, Manhattan"},
				{user_id:5,name:"", description:"The Wolf of Wall Street", latitude:40.711544100000000000,longitude:-74.013486899999970000,address:"North Cove Marina (Near World Trade Center) Manhattan"},
				{user_id:6,name:"", description:"The Wolf of Wall Street", latitude:40.7273517,longitude:-73.86406069999998,address:"Shalimar Diner, 6368 Austin Street, Flushing, Queens"},
				{user_id:1,name:"", description:"When Harry met Sally", latitude:40.730822800000000000,longitude:-73.997332000000030000,address:"Washington Square Park, Greenwich Village, Manhattan"},
				{user_id:2,name:"", description:"When Harry met Sally", latitude:40.722531700000000000,longitude:-73.986982899999980000,address:"Katz's Delicatessen, 205 East Houston Street and Ludlow Street, Manhattan"},
				{user_id:3,name:"", description:"Superman", latitude:40.7498855,longitude:-73.97322029999998,address:"220 East 42nd Street (btw 2nd and 3rd Avenue) Manhattan"},
				{user_id:4,name:"", description:"The Royal Tennenbaums", latitude:40.8239665,longitude:-73.94671890000001,address:"44 West 144th Street and Convent Avenue, Manhattan"},
				{user_id:5,name:"", description:"Raging Bull", latitude:40.7302355,longitude:-74.00684330000001,address:"St Luke's Place, Leroy Street and Hudson Street, Manhattan"},
				{user_id:6,name:"", description:"Night at the Museum", latitude:40.773338000000000000,longitude:-73.955057899999990000,address:"Central Park West and 79th Street, Manhattan"},
				{user_id:1,name:"", description:"Men in Black", latitude:40.706828600000000000,longitude:-74.017580200000000000,address:"Battery Place (btw Washington & Greenwich Streets) Manhattan"},
				{user_id:2,name:"", description:"Madagascar", latitude:40.767778000000000000,longitude:-73.971833500000000000,address:"Central Park, Manhattan"},
				{user_id:3,name:"", description:"Rocky", latitude:39.9899502,longitude:-75.12389519999999,address:"2702 Ruth Street, Philadelphia, Penn"},
				{user_id:4,name:"", description:"Rocky", latitude:39.965569700000000000,longitude:-75.180966099999980000,address:"2600 Benjamin Franklin Pkwy, Philadelphia, PA 19130, United States (Philadelphia Museum of Art)	"},
				{user_id:5,name:"", description:"Scarface", latitude:34.440035,longitude:-119.646773,address:"631 Para Grande Lane, Santa Barbara, California, USA"},
				{user_id:6,name:"", description:"Scarface", latitude:25.777331,longitude:-80.13161000000002,address:"728 Ocean Drive, Miami Beach, Florida, USA	"},
				{user_id:1,name:"", description:"Home Alone", latitude:42.1097127,longitude:-87.73361419999998,address:"671 Lincoln Avenue, Winnetka, Illinois"},
				{user_id:2,name:"", description:"Manhattan", latitude:40.767095600000000000,longitude:-73.979573200000000000,address:"Riverview Terrace, Sutton Square, 59th Street, New York"},
				{user_id:3,name:"", description:"Italian Job", latitude:51.421850400000000000,longitude:-0.072385299999950800,address:"Canada Gates, Crystal Palace Park, London"},
				{user_id:4,name:"", description:"Goodfellas", latitude:40.765418100000000000,longitude:-73.889041799999970000,address:"Jackson Hole Diner, Astoria Boulevard, Queens"},
				{user_id:5,name:"", description:"Die Hard", latitude:34.055223200000000000,longitude:-118.413264200000010000,address:"Fox Plaza, 2121 Avenue of the Stars, Century City, Los Angeles"},
				{user_id:6,name:"", description:"Breakfast at Tiffany's", latitude:40.7681348,longitude:-73.95888939999998,address:"East 71st Street, East Side, New York"},
				{user_id:1,name:"", description:"Breakfast at Tiffany's", latitude:40.774731400000000000,longitude:-73.965373399999980000,address:"Tiffany & Co, Fifth Avenue, New York"},
				{user_id:2,name:"", description:"Ghostbusters", latitude:40.7200197,longitude:-74.00937669999996,address:"North Moore Street, New York"},
				{user_id:3,name:"", description:"Sound of Music", latitude:47.7772976,longitude:13.061087499999985,address:"Schloss Frohnburg, Hellbrunner Allee 53, 5020 Salzburg, Austria"},
				{user_id:4,name:"", description:"The Godfather", latitude:40.6059585,longitude:-74.10133580000002,address:"10 Longfellow Avenue, Staten Island, New York, United States"},
				{user_id:5,name:"", description:"The Godfather", latitude:40.546457900000000000,longitude:-74.141466199999970000,address:"6581 Hylan Boulevard, Staten Island, New York, United States"},
				{user_id:6,name:"", description:"The Notebook", latitude:32.681832900000000000,longitude:-80.176346700000010000,address:"Martin's Point Plantation Wadmalaw Island, SC"},
				{user_id:1,name:"", description:"The Notebook", latitude:34.039415100000000000,longitude:-118.875812000000000000,address:"El Matador Beach, in Malibu"},
				{user_id:2,name:"", description:"Goldeneye", latitude:46.1964953,longitude:8.84845580000001,address:"Verzasca Dam,Vogorno Switzerland"},
				{user_id:3,name:"", description:"Attack on Titan", latitude:34.665442000000000000,longitude:135.432338200000000000,address:"Universal Studios Japan, 2 Chome-1-33 Sakurajima,Konohana Ward, Osaka, Osaka Prefecture 554-0031, Japan"},
				{user_id:4,name:"", description:"Amelie", latitude:48.8849052,longitude:2.3336640999999645,address:"Café des Deux Moulins 15 Rue Lepic 75018 Paris  France"},
				{user_id:5,name:"", description:"On Her Majesty's Secret Service", latitude:46.557202000000000000,longitude:7.835206500000027000,address:"The revolving restaurant, Piz Gloria, Schilthorn, Switzerland"},
				{user_id:6,name:"", description:"The Fox and the Hound", latitude:51.517399,longitude:-0.07359020000001237,address:"50 Commercial Street, London, E1"},
				{user_id:1,name:"", description:"Lost in Translation", latitude:35.672089199999990000,longitude:139.770591999999970000,address:"Ginza, Chuo, Tokyo 104-0061, Japan"},
				{user_id:2,name:"", description:"Notting Hill", latitude:51.51670319999999,longitude:-0.2060086000000183,address:"280 Westbourne Park Road, Notting Hill, London, W11"},
				{user_id:3,name:"", description:"Lock, Stock and Two Smoking Barrels", latitude:51.506996600000000000,longitude:-0.094696800000065200,address:"Park Street, Borough, London, SE1"},
				{user_id:4,name:"", description:"Skyfall", latitude:51.4879383,longitude:-0.12318370000002687,address:"SIS Building, Vauxhall Cross, London"},
				{user_id:5,name:"", description:"Grease", latitude:33.997011700000000000,longitude:-118.443357900000020000,address:"Venice High School, 13000 Venice Blvd, LA, CA 90066, US"},
				{user_id:6,name:"", description:"Inception", latitude:48.8557119,longitude:2.287751500000013,address:"Pont de Bir-Hakeim, Quai de Grenelle, 75015, Paris, France"},
				{user_id:1,name:"", description:"Snatch", latitude:51.51843909999999,longitude:-0.1074270000000297,address:"Ye Olde Mitre Tavern, Hatton Garden, London, EC1"},
				{user_id:2,name:"", description:"Mission Impossible", latitude:51.506802000000000000,longitude:-0.093197599999939480,address:"Anchor Tavern, Bankside, London, SE1"}
	])

# # Location:
# # id | name | description | latitude | longitude | address | created_at | updated_at | user_id 





Scene.create([
				{movie_id:1,location_id:1,image_file_name:"http://bit.ly/1JBfXCZ"},
				{movie_id:9,location_id:2,image_file_name:"http://bit.ly/1FV4d9t"},
				{movie_id:12,location_id:3,image_file_name:"http://bit.ly/1GQGxVk"},
				{movie_id:13,location_id:4,image_file_name:"http://bit.ly/1LFNAWC"},
				{movie_id:14,location_id:5,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Dark%20Knight%20-%20screen%20still_zpszka5gkbe.jpeg"},
				{movie_id:15,location_id:6,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Dark%20Knight%20rises%20-%20screen%20still_zpsi2jk7isk.jpeg"},
				{movie_id:15,location_id:7,image_file_name:"http://bit.ly/1GQTUVq"},
				{movie_id:23,location_id:8,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/The%20Avengers%20-%20screen%20still_zpsieusxjko.jpeg"},
				{movie_id:25,location_id:9,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Live%20and%20Let%20Die%20-%20screen%20still_zpsizml5ccl.jpeg"},
				{movie_id:24,location_id:10,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Zoolander%20-%20screen%20still_zpsmx6g4oru.jpeg"},				
				{movie_id:26,location_id:11,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Wolf%20of%20Wall%20Street%20-%20screen%20still_zpstzmswk3d.jpeg"},
				{movie_id:26,location_id:12,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Wolf%20of%20Wall%20Street%20-%20cafe%20-%20screen%20still_zpsb21l2xhp.jpeg"},
				{movie_id:27,location_id:13,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/When%20Harry%20Met%20Sally%20-%20dropping%20off%20-%20screen%20still_zps5hturcxr.jpeg"},
				{movie_id:27,location_id:14,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/When%20Harry%20Met%20Sally%20-%20cafe%20-%20screen%20still_zps31nytf79.jpeg"},
				{movie_id:28,location_id:15,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Superman%20-%20screen%20still_zpsdxgfqgja.jpeg"},
				{movie_id:29,location_id:16,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/The%20Royal%20Tenenbaums%20-%20screen%20still_zps264i4fzn.jpeg"},
				{movie_id:30,location_id:17,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Raging%20Bull%20-%20screen%20still_zpsk8mom43b.jpeg"},
				{movie_id:31,location_id:18,image_file_name:"http://bit.ly/1emtjb8"},
				{movie_id:32,location_id:19,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Men%20In%20Black%20-%20screen%20still_zpsiuqipy7j.jpeg"},
				{movie_id:21,location_id:20,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Madagascar%20-%20screen%20still_zps1fh0khop.jpeg"},
				{movie_id:33,location_id:21,image_file_name:"http://bit.ly/1gcPQbU"},
				{movie_id:33,location_id:22,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Rocky%20-%20steps%20-%20screen%20still_zpsu97vpyao.jpeg"},
				{movie_id:17,location_id:23,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Scarface%20-%20mnsion%20-%20screen%20still_zpscz52i3v2.jpeg"},
				{movie_id:17,location_id:24,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Scarface%20-%20chainsaw%20-%20screen%20still_zpshuczz3lp.jpeg"},
				{movie_id:34,location_id:25,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Home%20Alone%20-%20screen%20still_zps1xi2htsf.jpeg"},
				{movie_id:18,location_id:26,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Manhatten%20-%20screen%20still_zpsm4gdkih5.jpeg"},
				{movie_id:35,location_id:27,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Italian%20Job%20-%20screen%20still_zpsj897cyac.jpeg"},
				{movie_id:36,location_id:28,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Goodfellas%20-%20screen%20still_zpsvzajaw2o.jpeg"},
				{movie_id:40,location_id:29,image_file_name:"http://bit.ly/1LKsyHb"},
				{movie_id:8,location_id:30,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Breakfast%20at%20Tiffanys%20-%20apartment%20-%20screen%20still_zps3xe4fhq7.png"},
				{movie_id:8,location_id:31,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Breakfast%20at%20Tiffanys%20-%20Tiffanys%20-%20screen%20still_zpsp3scxvlz.jpeg"},
				{movie_id:11,location_id:32,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Ghostbusters%20-%20screen%20still_zpsbvuenp9t.png"},
				{movie_id:10,location_id:33,image_file_name:"http://eonli.ne/1JBqu14"},
				{movie_id:16,location_id:34,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Godfather%20-%20Corleone%20Compund%20-%20screen%20still_zpsbbnhg1un.jpeg"},
				{movie_id:16,location_id:35,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Godfather%20-%20screen%20still_zps8rq4nphk.jpeg"},
				{movie_id:37,location_id:36,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Notebook%20-%20Noahs%20House%20-%20screen%20still_zpskhamnukd.jpeg"},
				{movie_id:37,location_id:37,image_file_name:"http://bit.ly/1FVfKFz"},
				{movie_id:38,location_id:38,image_file_name:"http://bit.ly/1FVg0EB"},
				{movie_id:6,location_id:39,image_file_name:"http://bit.ly/1zlQshZ"},
				{movie_id:5,location_id:40,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Amelie%20-%20Cafe%20-%20Screen%20Still_zpswdickgjk.jpeg"},
				{movie_id:7,location_id:41,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/OHMSS%20-%20Blofield%20Lair%20-%20screen%20still_zpsx0k37ay4.jpeg"},
				{movie_id:39,location_id:42,image_file_name:"http://bit.ly/1GRlRvu"},
				{movie_id:4,location_id:43,image_file_name:"http://i284.photobucket.com/albums/ll37/ashleigh_louise1/Movie%20Snaps/Stills/Lost%20in%20Translation%20-%20Screen%20Still_zpspqyw2lgx.png"},
				{movie_id:19,location_id:44,image_file_name:"http://bit.ly/1CNbbNz"},
				{movie_id:20,location_id:45,image_file_name:"http://bit.ly/1NziuOC"},
				{movie_id:41,location_id:46,image_file_name:"http://bit.ly/1Cdt0uI"},
				{movie_id:2,location_id:47,image_file_name:"http://bit.ly/1JzY0aI"},
				{movie_id:3,location_id:48,image_file_name:"http://bit.ly/1Kw13PD"},
				{movie_id:22,location_id:49,image_file_name:"http://bit.ly/1IRx2Wq"},
				{movie_id:42,location_id:50,image_file_name:"http://bit.ly/1LX1Hoe"}
	])

# Scenes:
# id | movie_id | location_id | image_file_name | image_content_type | image_file_size | image_updated_at 

# The Da Vinci Code
# 	The Pyramid, Louvre, Paris
# 		Robert Langdon is summoned to the murder scene





Visit.create([
				{scene_id:1,user_id:1},
				{scene_id:2,user_id:2},
				{scene_id:3,user_id:3},
				{scene_id:4,user_id:4},
				{scene_id:5,user_id:5},
				{scene_id:6,user_id:6},
				{scene_id:7,user_id:1},
				{scene_id:8,user_id:2},
				{scene_id:9,user_id:3},
				{scene_id:10,user_id:4},
				{scene_id:11,user_id:5},
				{scene_id:12,user_id:6},
				{scene_id:13,user_id:1},
				{scene_id:14,user_id:2},
				{scene_id:15,user_id:3},
				{scene_id:16,user_id:4},
				{scene_id:17,user_id:5},
				{scene_id:18,user_id:6},
				{scene_id:19,user_id:1},
				{scene_id:20,user_id:2},
				{scene_id:21,user_id:3},
				{scene_id:22,user_id:4},
				{scene_id:23,user_id:5},
				{scene_id:24,user_id:6},
				{scene_id:25,user_id:1},
				{scene_id:26,user_id:2},
				{scene_id:27,user_id:3},
				{scene_id:28,user_id:4},
				{scene_id:29,user_id:5},
				{scene_id:30,user_id:6},
				{scene_id:31,user_id:1},
				{scene_id:32,user_id:2},
				{scene_id:33,user_id:3},
				{scene_id:34,user_id:4},
				{scene_id:35,user_id:5},
				{scene_id:36,user_id:6},
				{scene_id:37,user_id:1},
				{scene_id:38,user_id:2},
				{scene_id:39,user_id:3},
				{scene_id:40,user_id:4},
				{scene_id:41,user_id:5},
				{scene_id:42,user_id:6},
				{scene_id:43,user_id:1},
				{scene_id:44,user_id:2},
				{scene_id:45,user_id:3},
				{scene_id:46,user_id:4},
				{scene_id:47,user_id:5},
				{scene_id:48,user_id:6},
				{scene_id:49,user_id:1},
				{scene_id:50,user_id:2}
	])


# Visit:
# id | description | date_visited | scene_id | user_id 
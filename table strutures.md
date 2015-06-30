USERS - Done
-----
ID
username
name
avatar(facebook)
email


LOCATIONS - Done
------------
ID
google street address
description
latitude
longtiude
User_ID  (destinations are created by a user)


VISITS
------
ID
Description
Date Visited
Scene_ID     (Visit a scene)
User_ID       (user creates a visit)


SCENES
------
ID
Location_ID
Movie_ID
link to media (image source)


MOVIE - done
-----
ID
imdbID
Name



PHOTOS
------
ID
caption
link to media (image source)
User_ID  (User upoads a )
Visit_ID (A visit can have many photos)


LIKES
-----
ID
Photo_ID
User_ID


COMMENTS
--------
ID
Comment
user_ID
photo_ID

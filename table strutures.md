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


VISITS - done
------
ID
Description
Date Visited
Scene_ID     (Visit a scene)
User_ID       (user creates a visit)


SCENES - done
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



PHOTOS - done
------
ID
caption
link to media (image source)
Visit_ID (A visit can have many photos)


LIKES - done
-----
ID
Photo_ID
User_ID


COMMENTS -done
--------
ID
Remark
user_ID
photo_ID

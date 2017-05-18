# Photo Share Application
## Objective
In this project, I designed, implemented and documented a database system for a web based photo social sharing application. I also provide the web based interface to the database. The final system is similar to Instagram!

## Database Design
### Users
Each user is identiﬁed by a unique user id and has the following attributes: ﬁrst name, last name, email, date of birth, hometown, gender, and password. A user can have a number of Albums.

### Friends
Each user can have any number of friends.

### Albums
Each album is identiﬁed by a unique album id and has the following attributes: name, owner (user) id, and date of creation. Each album can contain a number of photos.

### Photos
Each photo is identiﬁed by a unique photo id and must belong to an album. Each photo has the following attributes: caption and data. Each photo can only be stored in one album and is associated with zero, one, or more tags.

### Tags
Each tag is described by a single word. Many photos can be tagged with the same tag. For the purpose of this project we will assume that all tags are lower-cased and contain no spaces. 

### Comment
Each comment is identiﬁed by a unique comment id and has the following attributes: text (i.e., the actual comment), the comment's owner (a user) and the date the comment was left.

## Use Cases
### User Management
**Becoming a registered user.**
Before being able to upload photos a user should register by providing their ﬁrst name, last name, email address, date of birth, and a password. If the user already exists in the database with the same email address an error message should be produced. The other additional information about each user is optional.

**Adding and Listing Friends**
You should allow a user to add a new friend on the friend list. For simplicity, you do not have to verify the friendship relationship. Also, you should allow the user to search for other users in the system (in order to ﬁnd friends to add.) Finally, you must allow a user to list his/her friends.

**User activity** 
To motivate users in using the site we'd like to identify the ones who make the largest contribution and list them on the site. We'll measure the contribution of a user as the number of photos they have uploaded plus the number of comments they have left for photos belonging to other users. The top 10 users should be reported.

### Album and photo management
**Photo and album browsing** 
Every visitor to the site, registered or not, should be allowed to browse photos. In this project we will assume that all photos and albums are made public by their authors.

**Photo and album creating**
After registration, users can start creating albums and uploading photos. The relevant ﬁelds are described above. Users should also be able to delete both albums and photos. Users should only be allowed to modify and delete albums and photos which they own.

### Tag management
**Viewing your photos by tag name** 
Tags provide a way to categorize photos and each photo can have any number of tags. 

**Viewing all photos by tag name**
The system also allow users to view all photos that contain a certain tag, i.e., not only the ones they have uploaded but also photos that belong to other users.

**Viewing the most popular tags**
A function should be provided that lists the most popular tags, i.e., the tags that are associated with the most photos. 

**Photo search**
The functionality is be provided so that both visitors and registered users can search through the photos by specifying conjunctive tag queries. For example a visitor could enter the words "friends boston" in a text ﬁeld, click the search button and be presented with all photos that contain both the tag "friends" and the tag "boston".

### Comments
**Leaving comments** 
Both registered and anonymous users can leave comments. Users cannot leave comments for their own photos. If registered user leaves a comment then this counts towards their contribution score as described above.

**Like functionality**
We want to add a **Like** functionality. If a user likes a photo, should be able to add a like to the photo. Also, we must be able to see how many likes a photo has and the users that liked this photo.

### Recommendations
**'You-may-also-like' functionality**
Given the type of photos uploaded by a user we'd like to make some recommendations to them about other photos they may like. 

**Tag recommendation functionality** 
We want to assist users in selecting tags for their photos. To do that ask the user to enter a couple of tags that they already have in mind. Perform a query and ﬁnd all the photos, belonging to any user, that contain these tags. Report back the most frequent tags as recommendations.

## Installation
To install all dependencies:
`python3 -m pip install --upgrade --no-cache-dir -r requirements.txt`

To run the web service in the main directory:    
`export FLASK_APP=app.py`     
`flask run`    
To Open in the browser:    
`http://localhost:5000/`

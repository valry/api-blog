# README

curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X POST \
-d '{"start_date":"10.01.1900","end_date":"11.12.2016","email":"qo-op@list.ru"}' https://api-blog-a.herokuapp.com/api/v1/reports/by_author.json


curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X GET \
-d '{"page":"4","per_page":"1"}' https://api-blog-a.herokuapp.com/api/v1/posts.json -i 
("-i" for check total pages and total count in headers)

curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X GET \
https://api-blog-a.herokuapp.com/api/v1/posts/54.json


curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X POST \
-d '{"title":"this_is_title","body":"this is body","published_at":"20.05.1999"}' \
https://api-blog-a.herokuapp.com/api/v1/posts.json

heroku config:add CLOUDINARY_URL=cloudinary://API_KEY:API_SECRET@CLOUD_NAME
heroku config:set S3_KEY=8N029N81 S3_SECRET=9s83109d3+583493190

#<User id: 2, nickname: "Milo Hammes", email: "vena@smitham.org", password: "A9DsOh6nL", created_at: "2016-10-27 07:46:06", updated_at: "2016-10-27 07:46:06">

key: "4ec945dd34d3c121e6dee6b8e293b476"
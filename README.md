# README
host: https://api-blog-a.herokuapp.com

### Enter user name " Milo Hammes "

(You can change avatar and preview it before loading)


### API requests

key: "4ec945dd34d3c121e6dee6b8e293b476" - user Milo Hammes
```
curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X POST \
-d '{"start_date":"10.01.1900","end_date":"11.12.2016","email":"qo-op@list.ru"}' https://api-blog-a.herokuapp.com/api/v1/reports/by_author.json
```
```
curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X GET \
-d '{"page":"4","per_page":"1"}' https://api-blog-a.herokuapp.com/api/v1/posts.json -i 
```
("-i" for checking total pages and total count in headers)
```
curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X GET \
https://api-blog-a.herokuapp.com/api/v1/posts/54.json
```
```
curl -H "Content-Type: application/json" -H "Authorization: 4ec945dd34d3c121e6dee6b8e293b476" -X POST \
-d '{"title":"this_is_title","body":"this is body","published_at":"20.05.1999"}' \
https://api-blog-a.herokuapp.com/api/v1/posts.json
```

### Heroku dependences

heroku config:add CLOUDINARY_URL=cloudinary://API_KEY:API_SECRET@CLOUD_NAME

(Works only for smtp.mail.ru)
heroku config:set SMTP_EMAIL=your email SMTP_PASS=your password

Addon REDISTOGO installation and sidekiq worker configuration are also needed (see procfile for configure sidekiq)
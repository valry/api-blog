# README

curl -H "Content-Type: application/json" -H "Authorization: 0b2a40f64959e2d8d712c23f90292104" -X POST \
-d '{"start_date":"10.01.1900","end_date":"11.12.2016","email":"qo-op@list.ru"}' http://localhost:3000/api/v1/reports/by_author.json -i


curl -H "Content-Type: application/json" -H "Authorization: 0b2a40f64959e2d8d712c23f90292104" -X GET \
-d '{"page":"4","per_page":"1"}' http://localhost:3000/api/v1/posts.json -i

curl -H "Content-Type: application/json" -H "Authorization: 0b2a40f64959e2d8d712c23f90292104" -X GET \
http://localhost:3000/api/v1/posts/46.json -i


curl -H "Content-Type: application/json" -H "Authorization: 0b2a40f64959e2d8d712c23f90292104" -X POST \
-d '{"title":"this_is_title","body":"this is body","published_at":"20.05.1999"}' http://localhost:3000/api/v1/posts.json


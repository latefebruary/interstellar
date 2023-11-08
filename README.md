# README

* Установка гемов

`$ bundle install`

* Создать базу

`$ rails db:create db:migrate`

* Записать в крон таски:

`$ bundle exec whenever`
`$ bundle exec whenever --update-crontab`

* Запустить сервер

`$ rails s`

//-------------------------------------

Ссылку на RSS источник нужно положить в .env файл

//-------------------------------------

Чтобы запрашивать статьи, необходимо зарегистрироваться. Для этого нужно отправить логин и пароль:

заголовок указать Content-Type: application/json

POST http://localhost:3000/users
{
	"username": "test",
	"password": "pass"
}


В ответ придет токен, его необходимо передавать в запрос для получения статей

GET http://localhost:3000/api/articles

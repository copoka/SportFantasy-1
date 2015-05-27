SportFantazy.ru
=================

http://goo.gl/dM7d1U - задачи

http://goo.gl/59alWZ - идея, которую мы ждали джва года

http://goo.gl/bRK3D0 - скиллсы местных анонов

Использование
-----------------

Перед запуском сервера нужно сконфигурировать секретный токен:

* Выполнить команду rake secret
* Создать файл SportFantasy/config/initializers/secret_token.rb
* Поместить в файл сконфигурированный ключ  SportFantasy::Application.config.secret_token = 'token'

Настройка MySQL сервера для среды development:

* Установить MySQL и по желанию: MySQL Workbench
* Создать БД и пользователя для нее
```
mysql -uroot -p
mysql> CREATE DATABASE sport_fantasy_db CHARACTER SET utf8 COLLATE utf8_general_ci;
mysql> GRANT ALL PRIVILEGES ON sport_fantasy_db.* TO 'railsuser'@'localhost' IDENTIFIED BY 'railspass' WITH GRANT OPTION;
```

* Чтобы перенести схему БД в СУБД, надо выполнить rake db:migrate
* Чтобы заполнить БД фейковыми данными, надо выполнить rake db:seed:sample_data
* Чтобы удалить данные из всех таблиц: rake db:seed:clear_all_tables
* Чтобы включить поиск по БД через Sphinx, надо выполнить rake ts:index и rake ts:start (естественно, сфинкс должен стоять)

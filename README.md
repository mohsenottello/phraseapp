# README

The goal of this task is to build a basic web service for managing articles.

# Assumption

* Article can have many questions
* Question can have only one answer

For Impelementing this task, we have 3 models.

* Article contains one english content and one german content.
* Question contains one english content and one german content.
* Answer contains one english content and one german content.

For these 3 models, I used one table(content) with 4 columns

* description
* description_de
* content_type
* parent_id
* time stamps(created_at, updated_at)

The service consists of 3 controllers for handling requests.

* Article contains index, new, create, show, edit, update and destroy.
* Question contains new, create, edit, update and destroy.
* Answer contains new, create, edit, update and destroy.

we have one worker which try to translate description and store it in description_de column after creating and updating each model.

Unforunetly, I cannot find free credential for implementing translator service in my system

## How to use
 after running server, you can have access to articles by using this address
  `0.0.0.0:3000` or  `0.0.0.0:3000/articles`

## Development environment setup
To run and use this app as I did, you need to have docker and docker-compose on your machine:
* Docker version 18.09.6
* docker-compose version 1.23.2

#### 1 Prepare DB
  * Create User

    ```bash
    docker-compose run app psql -h postgres -p 5432 -c "CREATE USER ottello WITH PASSWORD 'ottello';" postgres -U postgres
    docker-compose run app psql -h postgres -p 5432 -c "ALTER USER ottello WITH SUPERUSER;" postgres -U postgres
    ```

  * Create DBs

    ```bash
    docker-compose run app psql -h postgres -p 5432 -c "CREATE DATABASE test_app_dev;" postgres -U postgres
    docker-compose run app psql -h postgres -p 5432 -c "CREATE DATABASE test_app_test;" postgres -U postgres
    ```
  * Migrate

    ```bash
    docker-compose run app rails db:migrate RAILS_ENV=test
    docker-compose run app rails db:migrate
    ```

#### 2 Run server
This command runs puma web server , postgresql, sidekiq and redis:

`docker-compose up`

#### 3 Run rails console
`docker-compose run app rails c`

#### 4 Run rspec test
`docker-compose run -e "RAILS_ENV=test" app  bundle exec rspec`

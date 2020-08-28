# Ruby on Rails API only

Commands to download dependencies and start the application:

1. `sudo -- sh -c -e "echo '127.0.0.1 api.task-manager.test' >> /etc/hosts";`
2. `bundle install`
3. `rails db:create db:migrate`
4. `rails s`

Commands used to create the application:

1. `rails g rspec:install`
2. `rails g devise:install`
3. `rails g devise user`
4. `rspec`
   - `spring rspec`
   - `spring rspec <dir>/<file>.rb --format=d`
5. `rails g controller api/v1/users`
6. `rails c`
   - `User.create(email: "caio.agiani14@gmail.com", password: "123123", password_confirmation: "123123")`
   - `User.all`
   - `User.count`

## Test

```javascript
caio-agiani in task-manager-api on  master [!] ❯ spring rspec
Running via Spring preloader in process 83972

Randomized with seed 51442
.................

Finished in 0.47991 seconds (files took 0.16648 seconds to load)
17 examples, 0 failures

Randomized with seed 51442
```

# README

Projeto para a disciplina de TCC II com o tema de Ecommerce voltado para econômia solidária

# Configurando o sistema
Para configurar o sistema no seu computador você precisa do ruby, node e yarn configurado no seu computador.

Para o ruby e yarn você pode instalar com o gerenciador de versão asdf (https://asdf-vm.com/guide/getting-started.html).

Ruby: 3.1.2
Rails 7.0.2
Node: 16+
Yarn: 1.22+
Libvips: https://installati.one/ubuntu/20.04/libvips-dev/

Siga os passos abaixo para configurar o sistema no seu computador.
1. Instalar todas as dependências assets: `yarn install`
2. Instalar todas as dependências do rails (gems): `bundle install`
3. Configure o arquivo `database.yml` que está na pasta config com seu usuário e senha.
4. Com o banco de dados configurado gere os bancos: `rails db:create`
5. Agora execute as migrações: `rails db:migrate`

# Iniciando o projeto
Agora com tudo configurado, basta executa `rails s`


### Usando com docker

1. Create file `.env` and `env.test` off file `.env.sample`.

2. Add values in the variables empties

3. Add value below on file `.env`

```yml
DATABASE_URL=postgres://postgres:postgres@db:5432/projeto_development
```

4. Add value below on file `.env.test`

```yml
DATABASE_URL=postgres://postgres:postgres@db:5432/projeto_test
```

5. Create file `.env.sidekiq` and add values below:
```
REDIS_URL=redis://redis:6379/0
SIDEKIQ_WORKERS=5
DATABASE_URL=postgres://postgres:postgres@db:5432/projeto_development
```
6. Execute the command below for build image
```
docker-compose up -d --no-deps --build app
```
7. Execute the command below for start project
```
docker compose up -d
```
8. Execute the command below for access bash
```
docker compose run --rm app bash
```
9. Execute the command below for create database
```
rails db:create
```
10. Execute the command below for migration database
```
rails db:migrate
```
11. Execute the command below for populate database
```
rails db:seed
```

# Command extras
Reset stats sidekiq
```
Sidekiq::Stats.new.reset
```
For the test rspec, execute the command below
```
ENV_FILE=.env.test docker compose run --rm app rspec
```
For execute rubocop
```
docker compose run --rm app rubocop
```
For debug with binding.pry
```
docker attach --detach-keys="ctrl-c" <id_do_container_app>
```
# solidary-ecommerce

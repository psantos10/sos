# SOS Angola

https://sos.ao

## Requirements

| Software | Version | Description |
|-|-|-|
| Ruby | 2.7.1 | Ruby Programming Language |
| PostgreSQL | 12.x or higher | Relational Database System |
| Nodejs | Latest LTS version | JavaScript Runtime |
| Yarn | 1.22.x or < 2 | Javascript Package Manager |

## Install Dependencies

### Backend

> $ bundle install

### Frontend

> $ yarn install

## Setup Database

**SOS Angola** project uses PostgreSQL as a relational database system. After install PostgreSQL locally, you can create
database and tables structures as follows.

Start creating the database (First time):

> $ bundle exec rails db:create

Run all pending migrations:

> $ bundle exec rails db:migrate

## Running the application locally

You need to setup a local hostnames that points to 127.0.0.1.

sos.local -> 127.0.0.1<br>
app.sos.local -> 127.0.0.1<br>
api.sos.local -> 127.0.0.1<br>

### Backend

> $ bundle exec rails s -b 0.0.0.0

### Frontend

> $ bin/webpack-dev-server


## Running test suite and Linters

### Backend

> $ bundle exec rspec
>
> $ bundle exec rubocop

### Frontend

> 

## Contributing / Participation

Contibutions are welcome!

Note please that following is strongly requested:

* All changes must be submitted through PRs.
* Create only one PR per feature, bug fix or improvement.
* Document your PR properly in commits and PR
* Add tests for your changes and make sure they don't break existing tests.
* Run code linters (rubocop for Ruby, Prettier/ESLint for JavaScript) before submit your PR.

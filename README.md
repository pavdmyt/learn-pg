Play with Postgres
==================

## Setup

1. Make sure you have **docker** and **docker-compose** installed.
2. Clone this repo: `$ git clone https://github.com/pavdmyt/learn-pg.git`
3. `cd` into `learn-pg` directory
4. Execute `./run.sh start`
5. Check that `learn_postgres` container is running using `docker ps` command

You've done it!


## psql usage

Once you have `learn_postgres` container up and running, execute the following command to get into container:

```
$ docker exec -ti learn_postgres /bin/bash
```

Your command-prompt should change to something like `bash-4.4#`. Now you can run `psql`. Try `psql --help`.

To start working with database run the following:

```
$ psql -U postgres
```

The terminal prompt should change to `postgres=#`. Now you can for example create a table:

```
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
```

To verify that table has been created, use `\d` command.

Voila!

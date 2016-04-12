# Lab 1 - Getting Familiar with PostgreSQL

Note: This is more of a Code Along than a Lab.

## Install PostgreSQL

We will use `brew` to install PostgreSQL

```bash
brew install postgresql
```

## Verify the installation:

```
brew list | grep postgres     # should return postgresql
which postgres                # print the path to the executable
postgres --version            # should print "9.4.x"
```

## Automate the startup of postgres

### The manual/hard way (taken from `brew info postgresql`)

```
brew info postgresql          # will print instructions

# create a link to register postgres to autostart on login:
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# now you can either reboot your laptop or run the following:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# verify that postgres processes are running:
ps -ef | grep postgres        # should show a few processes
```

### The easy way via `brew services`

```
# First install brew services
brew tap homebrew/services

# Then start/stop/restart postgresql like this:
brew services [start|stop|restart] postgresql

# You can see a list of running services via:
brew services list
```

For more info, see: [Starting and Stopping Background Services with Homebrew](https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew)

## Helpful Commands

```
initdb -D /usr/local/var/postgres/   # manually start PostgreSQL
# or via brew services
brew services start postgresql
```

## Trouble Shooting

### Cannot start PostgreSQL

* Symptoms:
    - PostgreSQL not running and launchctl fails with the following error:

> postgresql.plist: Operation already in progress

* Solution:
    - view the PostgreSQL Server logs for potential errors:
      `subl /usr/local/var/postgres/server.log`
    - Google the last error and fix
    - One solution I found:
      `rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres`
    - Also may need to manually delete the pid file:
      `rm /usr/local/var/postgres/postmaster.pid`

* References:
    - https://github.com/Homebrew/homebrew/issues/35240
    - http://stackoverflow.com/questions/24379373/how-to-upgrade-postgres-from-9-3-to-9-4-without-losing-data

### Cannot start psql

* Symptoms:
    - psql: FATAL:  database "<user>" does not exist

* Solution:
    - Run createdb with no arguments to create a default database:
      `createdb`

### Cannot create a database

* Symptoms:
    - $ createdb  hangs / never returns

* Solution:
    - Mac OSX upgrades are known to remove empty directories under /usr/local/var which causes
      problems for PostgreSQL installations
    - To fix, run the following statements from the `bash` shell:

```
mkdir -p /usr/local/var/postgres/{pg_tblspc,pg_twophase,pg_stat_tmp}/
touch /usr/local/var/postgres/{pg_twophase,pg_stat_tmp}/.keep
pg_ctl start -D /usr/local/var/postgres
```

# Create a Database

```
createdb test1     # create a new database
psql test1         # connect to database
test1=# \l         # list all databases in PostgreSQL
test1=# \q         # quit
```

## Some PSQL Commands

```
\l               # list all databases
\c <database>    # connect to <database>
\d               # list all tables and other objects
\dt              # list all tables
\d <table_name>  # list details about <table_name>
\h               # show help
\q               # quit
```

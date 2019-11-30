# Discuss Ideas

A demo app to create ideas and discuss them with other users.
This app is built using Elixir and Phoenix to learn websockets, authentication and psql in Phoenix.

## What does the app do?

This app allows a user to view ideas.

The user can log in using github and access more functionality. Logged in users can:

- create ideas
- edit or delete their own idea
- comment on anyone idea in realtime

## Technology

#### Phoenix

The app is built in Phoenix 1.2, a web-framework for Elixir.

#### Ueberauth

Ueberauth is used to authenticate the user with Oauth, and in this case github. The user has a token set that provides access to restricted parts of the app that only logged in users should use. This token also identifies the user so that only that specific user can edit their own ideas and no one can touch and idea that they have not created.

#### PSQL

The app uses a PostgreSQL database. Writing to the database is quite different in Phoenix and does not employ creating any SQL statements. You create models of the database in phoenix to configure how the tables will work and then add rows by making them match a template changeset which is sent to the database.

#### Websockets

Websockets allow a permanent connection so that data displayed to the user can be updated live without the user needing to reload. Making the comments with websockets means that they become a live feature and the user will see new comments from any other user as they add them and they can be used as a real-time conversation.

The websocket is established in the front end with a javascript file which connects to the back end establishes a connection to whichever channel of comments the user should see relating to that idea.

## Run locally

Note - the app is currently configured to run on the heroku server. You will need to set up local environment variables and create your own github Oauth app keys to make it run. (and install erlang, elixir and phoenix)

To start a Phoenix app:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.create && mix ecto.migrate`
- Install Node.js dependencies with `npm install`
- Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

- Official website: http://www.phoenixframework.org/
- Guides: http://phoenixframework.org/docs/overview
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix

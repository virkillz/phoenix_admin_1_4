# PhoenixAdmin

This is customized version of Phoenix. Ready to launch any admin portal in minutes.

Compatible with Phoenix 1.4 and Elixir 1.7

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Check your database setting at `config/dev.exs` and match your postgresql credential
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Run seed `mix run priv/repo/seeds.exs` (if you are from asset folder, dont forget to back to root project folder `cd ..`)
  * Start Phoenix endpoint with `mix phx.server`
  * Login with username 'admin' and passsword 'admin'

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


If you want to generate HTML, you should use `mix custom.gen.html` instead of `mix phx.gen.html`
# Strainer

Analytics server written in Elixir. Proof of concept.

# Installation

Requires Elixir > 0.13 (uses Maps).

    $ mix deps.get
    $ mix run --no-halt

Then open <http://localhost:8002>.

# Sending fake data

Includes a Ruby script to send fake data. To run:

    $ gem install msgpack
    $ ruby fake_data.rb

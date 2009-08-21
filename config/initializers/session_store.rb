# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_respond_glue-example_session',
  :secret      => '56ae01a19f115cb5f1b44892f423faa10587f26fb55bc328a55bdead1b1d791db8bb2d60ee8da8eb918ebd1530e8c4b5a2dbc8ac33e116199d09500b611b1f5a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

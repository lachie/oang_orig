# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oang_session',
  :secret      => '96ddbb194571c0fe7c43c6cf8987959b5b08c403789309ce4fd2599123179ab8ca5ec0ddddb39725b4bd43a23f06194b1014af9efa7d6d22c0612bbc2d7bc18e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

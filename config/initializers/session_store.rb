# Be sure to restart your server when you modify this file.

require 'action_dispatch/middleware/session/dalli_store'
Lastmentioned::Application.config.session_store :dalli_store, :memcache_server => ['localhost'], :namespace => 'sessions', :key => '_foundation_session', :expire_after => 30.minutes

# Lastmentioned::Application.config.session_store :cookie_store, key: '_lastmentioned_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Lastmentioned::Application.config.session_store :active_record_store

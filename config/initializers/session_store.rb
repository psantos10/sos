# frozen_string_literal: true

domain = Rails.env.production? ? 'sos.ao' : 'sos.local'

Rails.application.config.session_store :cookie_store, key: '_sos_ao_session', domain: domain

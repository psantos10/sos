# frozen_string_literal: true

module RequestSpecHelper
  def authenticate_volunteer(volunteer_email:, volunteer_password: 'Super$123456')
    params = { auth: { email: volunteer_email, password: volunteer_password } }
    post '/api/volunteers/auth', params: params, headers: headers
  end
end

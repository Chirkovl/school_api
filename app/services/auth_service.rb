# frozen_string_literal: true

class AuthService
  def auth_token(student_id)
    salt = SecureRandom.hex(16)
    auth_token = Digest::SHA256.hexdigest("#{student_id}#{salt}")
    StudentAuth.create(student_id: student_id, auth_token: auth_token)

    auth_token
  end
end

class User
  include Clear::Model

  column first_name : String
  column last_name : String?
  column email : String

  column id : Int32, primary: true, presence: false

  column encrypted_password : Crypto::Bcrypt::Password

  def password=(new_password)
    self.encrypted_password = Crypto::Bcrypt::Password.create(new_password)
  end

  def verify_password(check_password : String)
    self.encrypted_password.verify(check_password)
  end
end

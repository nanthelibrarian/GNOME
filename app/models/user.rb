class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  has_many :plants

  def send_alert_email
    UserMailer.send_alert(self).deliver_now
  end
end

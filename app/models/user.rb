class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_events
  has_many :events, through: :user_events

  validates_integrity_of :avatar
  validates_processing_of :avatar

  def to_s
    "#{first_name} #{last_name}"
  end

  private

  def avatar_size_validation
    errors[:avatar] << "should be less thank 500kb" if avatar.size > 0.5.megabytes
  end
end

class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :photos

  def self.current_user_events(current_user)
    all.includes(:users).select{ |event| event.users.include?(current_user) }
  end

  # Returns user who created event
  def created_by(current_user)
    current_user.id == creator ? "me" : users.find(creator)
  end

  # checks if current user created event
  def created_by?(current_user)
    current_user.id == creator
  end
end

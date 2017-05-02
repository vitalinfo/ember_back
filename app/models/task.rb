class Task < ApplicationRecord
  belongs_to :user

  validates :user, :title, :start_at, presence: true

  validate :start_at_in_future, on: :create

  private

  def start_at_in_future
    errors.add(:start_at, 'can not be in the past') if start_at < Time.zone.now
  end
end

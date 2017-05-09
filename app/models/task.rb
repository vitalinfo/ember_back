class Task < ApplicationRecord
  belongs_to :user

  validates :user, :title, :start_at, presence: true

  validate :start_at_in_future, on: :create
  before_validation :set_ordinal
  after_initialize :set_defaults

  private

  def set_defaults
    self.completed ||= false
  end

  def set_ordinal
    return unless start_at
    self.ordinal ||= Task.where(user: user, start_at: start_at).maximum(:ordinal).to_i + 1
  end

  def start_at_in_future
    errors.add(:start_at, 'can not be in the past') if start_at && start_at < Time.zone.now.to_date
  end
end

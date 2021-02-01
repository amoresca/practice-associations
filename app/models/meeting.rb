class Meeting < ApplicationRecord
  has_many :speaker_meetings
  has_many :speakers, through: :speaker_meetings

  validates :title, :agenda, :location, :time, presence: true
  validate :time_cannot_be_in_the_past

  def time_cannot_be_in_the_past
    if time.present? && time < Date.today
      errors.add(:time, "can't be in the past")
    end
  end
end
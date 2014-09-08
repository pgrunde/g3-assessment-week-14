class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates_presence_of :medication, :dosage, :schedule, :starts_on, :ends_on
  validate :ends_later_than_starts?

  def ends_later_than_starts?
    if starts_on > ends_on
      errors.add(:starts_on, "must be before Ends on")
    end
  end
end
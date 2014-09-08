class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates_presence_of :medication, :dosage, :schedule, :starts_on, :ends_on
  validate :ends_later_than_starts?
  validate :dosage_must_start_with_numbers

  def ends_later_than_starts?
    if starts_on > ends_on
      errors.add(:starts_on, "must be before Ends on")
    end
  end

  def dosage_must_start_with_numbers
    first_text = dosage.split(" ").first
    if first_text.to_i == 0
      errors.add(:dosage, "must start with an integer")
    end
  end
end
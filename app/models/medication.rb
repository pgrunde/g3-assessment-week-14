class Medication < ActiveRecord::Base

  def find_patients
    arr = []
    scripts = Prescription.where(medication: self.name)
    scripts.each do |script|
      patient = Patient.find_by(id: script.patient_id)
      arr << "#{patient.first_name} #{patient.last_name}"
    end
    arr.uniq
  end

end
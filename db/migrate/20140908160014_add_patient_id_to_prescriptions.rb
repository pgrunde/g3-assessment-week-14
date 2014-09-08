class AddPatientIdToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :patient_id, :integer
  end
end

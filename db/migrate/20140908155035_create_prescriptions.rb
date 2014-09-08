class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :medication
      t.string :dosage
      t.string :schedule
      t.date :starts_on
      t.date :ends_on
    end
  end
end

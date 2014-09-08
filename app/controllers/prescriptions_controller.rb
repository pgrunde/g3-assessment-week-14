class PrescriptionsController < ApplicationController
  def new
    @patient = Patient.find_by(id: params[:patient_id])
    @prescription = Prescription.new
    @medications = Medication.all
  end

  # Parameters: {"utf8"=>"✓", "authenticity_token"=>"0sHBLv9Y5lgQty7HXIaCVmg382EIDYJ8Prq3DQcz09w=",
  # "prescription"=>{"medication"=>"med", "dosage"=>"dos", "schedule"=>"sched",
  # "starts_on(1i)"=>"2014", "starts_on(2i)"=>"9", "starts_on(3i)"=>"8", "ends_on(1i)"=>"2014", "ends_on(2i)"=>"9", "ends_on(3i)"=>"9"},
  # "commit"=>"Create Prescription", "patient_id"=>"5"}

  def create
    @patient = Patient.find_by(id: params[:patient_id])

    start_date = Date.new(
      params[:prescription]["starts_on(1i)"].to_i,
      params[:prescription]["starts_on(2i)"].to_i,
      params[:prescription]["starts_on(3i)"].to_i

    )
    end_date = Date.new(
      params[:prescription]["ends_on(1i)"].to_i,
      params[:prescription]["ends_on(2i)"].to_i,
      params[:prescription]["ends_on(3i)"].to_i
    )

    @prescription = Prescription.new(
      medication: params[:prescription][:medication],
      dosage: params[:prescription][:dosage],
      schedule: params[:prescription][:schedule],
      starts_on: start_date,
      ends_on: end_date,
      patient_id: params[:patient_id]
    )

    if @prescription.save
      flash[:notice] = "Your prescription has been created"
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

end
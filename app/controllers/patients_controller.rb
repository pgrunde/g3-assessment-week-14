class PatientsController < ApplicationController
  def show
    @patient = Patient.find_by(id: params[:id])
    @prescriptions = Prescription.where(patient_id: params[:id])
  end
end
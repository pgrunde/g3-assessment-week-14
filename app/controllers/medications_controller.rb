class MedicationsController < ApplicationController
  def show
    @medication = Medication.find_by(id: params[:id])
  end
end
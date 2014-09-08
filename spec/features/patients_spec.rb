require 'rails_helper'
require 'capybara/rails'

feature "Patients" do

  scenario "User sees all patients" do
    visit "/"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_content("Mercedes Jones")
  end

  it "user can click on a patient to see their prescriptions" do
    visit "/"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
    click_link "Mercedes Jones"
    expect(page).to have_content("Mercedes Jones")
  end

  it "user can create prescriptions via the 'add prescription' link" do
    # user = create_user
    # patient = create_patient
    # login(user)
    visit "/"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Mercedes Jones"
    click_link "Add Prescription"

    select "Tylenol", from: "Medication"
    fill_in "Dosage", with: "14 mg"
    fill_in "Schedule", with: "every 6 hours"
    select "2014", from: "prescription_starts_on_1i"
    select "September", from: "prescription_starts_on_2i"
    select "20", from: "prescription_starts_on_3i"
    select "2014", from: "prescription_ends_on_1i"
    select "September", from: "prescription_ends_on_2i"
    select "28", from: "prescription_ends_on_3i"
    click_button "Create Prescription"
    expect(page).to have_content "Your prescription has been created"
    expect(page).to have_content "Tylenol"
  end

end
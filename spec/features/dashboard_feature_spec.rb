require 'rails_helper'

feature 'A user wishes to view the statistics of a page' do

  context 'a visit is added then the dashbaord is viewed' do
    scenario 'user should see the dashboard screen following a vist. (DB01)' do
      create_visit
      visit '/dashboards'
      expect(page).to have_content 'Total Visits by Date'

      expect(page).to have_content 'Most Popular Movies'
      #expect(page).to have_content 'Da Vinci Code'

      expect(page).to have_content 'Most Active Users'
      #expect(page).to have_content 'John Doe'
    end
  end

end
require 'rails_helper'

def fill_autocomplete(field, options = {})
  fill_in field, with: options[:with]
  sleep 5
  page.execute_script %Q{ $('##{field}').trigger('keydown') }
  selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
  page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end

feature 'A user wants to add a location' do

  before(:each) do
    create_visit
    click_link 'here'
  end

  scenario 'and can enter the movie and have it autocompleted', js: true do
    fill_autocomplete('enterMovie', with: 'Shrek')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  context 'when entering a new location' do
    scenario 'can enter a new movie and be saved', js: true do
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Visit'
      click_button 'Place Marker'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Confirm Location' }.to change { Movie.count }.by 1
    end

    scenario 'can enter a duplicate movie, and it will not be saved' do
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Visit'
      click_button 'Place Marker'
      fill_in('enterMovie', with: 'The Da Vinci Code')
      expect { click_button 'Confirm Location' }.to change { Movie.count }.by 0
    end
  end

  context 'in an existing location' do
    scenario 'can add a new movie', js: true do
      click_link 'Louvre Pyramid, 75001, Paris, France'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Add movie' }.to change { Movie.count }.by 1
    end

  end

end
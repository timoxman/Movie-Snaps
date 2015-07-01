require 'rails_helper'

def fill_autocomplete(field, options = {})
  fill_in field, with: options[:with]
  sleep 1
  page.execute_script %Q{ $('##{field}').trigger('keydown') }
  selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
  page.should have_selector('ul.ui-autocomplete li.ui-menu-item')
  page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end

feature 'A user wants to add a location' do

  scenario 'and can enter the movie and have it autocompleted', js: true do
    visit '/'
    fill_autocomplete('enterMovie', with: 'Shrek')
  end

end
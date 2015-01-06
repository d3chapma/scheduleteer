require "test_helper"

class EventsTest < Capybara::Rails::TestCase
  def test_events_can_be_created
    visit root_path
    click_on 'New Event'
    fill_in 'Name', with: 'My New Event'
    click_on 'Create'
  end

  def test_events_can_be_viewed
    visit root_path
    click_on 'Sunday Service'
  end
end

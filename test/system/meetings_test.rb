# frozen_string_literal: true

require 'application_system_test_case'

class MeetingsTest < ApplicationSystemTestCase
  setup do
    @meeting = meetings(:meeting_one)
  end

  test 'visiting the index' do
    VCR.use_cassette('meetings_1') do
      visit meetings_url
      assert_selector 'h1', text: 'Meetings'
    end
  end

  test 'filter city council' do
    VCR.use_cassette('notes_2') do
      visit meetings_url
      assert_equal 4, page.all(:css, 'tr.data').size
      find(:css, '#meeting-filter').find(:option, 'City Council').select_option
      assert_equal 2, page.all(:css, 'tr.data').size
    end
  end
end

# frozen_string_literal: true

require 'application_system_test_case'

class OpeningsTest < ApplicationSystemTestCase
  setup do
    @opening = openings(:one)
  end

  test 'visiting the index' do
    visit openings_url
    assert_selector 'h1', text: 'Openings'
  end

  test 'should create opening' do
    visit openings_url
    click_on 'New opening'

    fill_in 'From at', with: @opening.from_at
    fill_in 'To at', with: @opening.to_at
    click_on 'Create Opening'

    assert_text 'Opening was successfully created'
    click_on 'Back'
  end

  test 'should update Opening' do
    visit opening_url(@opening)
    click_on 'Edit this opening', match: :first

    fill_in 'From at', with: @opening.from_at
    fill_in 'To at', with: @opening.to_at
    click_on 'Update Opening'

    assert_text 'Opening was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Opening' do
    visit opening_url(@opening)
    click_on 'Destroy this opening', match: :first

    assert_text 'Opening was successfully destroyed'
  end
end

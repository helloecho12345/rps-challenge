require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
feature 'play a game' do
PLAY_SEED = 221563

  before do
    visit '/'
    fill_in 'name', with: 'Bob'
    click_button 'Submit'
  end
  
  scenario 'see the options' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'choose an option' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock!'
  end

  scenario 'game chooses an option' do
    click_button 'Rock'

    message = find(:css, "#computer").text

    expect(possible_messages).to include message
  end

  # As a marketeer
  # So I can play a game
  # I want the game to choose a random option
  scenario 'computer chooses a random option' do
    srand(PLAY_SEED)
    click_button 'Rock'
    expect(page).to have_content 'Computer chose Scissors!'
  end

  def possible_messages
    [:rock, :paper, :scissors].map { |option| "Computer chose #{option.to_s.capitalize}!" }
  end
end

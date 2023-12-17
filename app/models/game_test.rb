require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "status should be valid" do
    valid_game = Game.new(status: 'playing', hours_played: 10)
    assert valid_game.valid?

    invalid_status_game = Game.new(status: 'invalid_status', hours_played: 5)
    assert_not invalid_status_game.valid?
  end

  test "hours_played should be present when status is not 'will_play'" do
    will_play_game = Game.new(status: 'will_play')
    assert_not will_play_game.valid?

    valid_will_play_game = Game.new(status: 'will_play', hours_played: 0)
    assert valid_will_play_game.valid?
  end
end
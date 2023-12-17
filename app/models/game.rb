# frozen_string_literal: true

# game
class Game < ApplicationRecord
  #this ensures that the values possible for status are the ones specified 
  validates :status, inclusion: { in: %w[playing played will_play], message: '%<value>s is not a valid status' }
  #makes sure ours played is inputed unless the ststus is will_play
  validates :hours_played, presence: true, unless: -> { status == 'will_play' }
end

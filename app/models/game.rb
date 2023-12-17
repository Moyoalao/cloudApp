# frozen_string_literal: true

class Game < ApplicationRecord
  validates :status, inclusion: { in: %w[playing played will_play],
                                  message: '%<value>s is not a valid status' }

  validates :hours_played, presence: true, unless: -> { status == 'will_play' }
end

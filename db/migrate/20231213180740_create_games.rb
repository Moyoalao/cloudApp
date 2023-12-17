# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :status
      t.float :hours_played

      t.timestamps
    end
  end
end

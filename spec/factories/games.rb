FactoryBot.define do
    factory :game do
      title { 'Sample Game' }
      status { 'will_play' }
      hours_played { 0 }
    end
  end
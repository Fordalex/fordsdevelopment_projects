namespace :quiz do
  # get "/subjects" => "subjects#index", as: :subjects_index
  get "/" => "flash_card_categories#index", as: :categories_index
  get "/flash_cards" => "flash_cards#index", as: :flash_cards_index

  post "/flash_card_category/play" => "flash_card_categories#play", as: :flash_card_categories_play
  post "/flash_cards/result_update" => "flash_cards#result_update", as: :flash_card_result_update
end

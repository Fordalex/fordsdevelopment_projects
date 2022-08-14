namespace :quiz do
  get "/" => "flash_card_categories#index", as: :home
  get "/flash_card_category/:flash_card_category_name" => "flash_card_categories#play", as: :flash_card_categories_play
  post "/flash_cards/result_update" => "flash_cards#result_update", as: :flash_card_result_update
end

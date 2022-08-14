namespace :quiz do
  get "/" => "flash_card_categories#index"
  get "/flash_card_category/:flash_card_category_name" => "flash_card_categories#play", as: :flash_card_categories_play
end

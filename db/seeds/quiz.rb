FlashCardCategory.delete_all
FlashCard.delete_all

front_end = FactoryBot.create(:flash_card_category, name: "Frontend")
back_end = FactoryBot.create(:flash_card_category, name: "Backend")
dev_ops = FactoryBot.create(:flash_card_category, name: "DevOps")

FactoryBot.create(:flash_card, flash_card_category: front_end)

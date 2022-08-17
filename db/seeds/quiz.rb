FlashCardCategory.delete_all
FlashCard.delete_all

front_end = FactoryBot.create(:flash_card_category, name: "Frontend")
back_end = FactoryBot.create(:flash_card_category, name: "Backend")
dev_ops = FactoryBot.create(:flash_card_category, name: "DevOps")

FactoryBot.create(:flash_card,
  flash_card_category: front_end,
  question: "What is W3C",
  answer: "World Wide Web Consortium"
)

FactoryBot.create(:flash_card,
  flash_card_category: front_end,
  question: "What is SEO",
  answer: "Search Engineer Optimization"
)

FactoryBot.create(:flash_card,
  flash_card_category: dev_ops,
  question: "What does TCP stand for",
  answer: "Transmission Control Protocol"
)

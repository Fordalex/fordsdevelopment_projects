FlashCardCategory.delete_all
FlashCard.delete_all

frontend = FactoryBot.create(:flash_card_category, name: "Frontend", colour: "#0f0")
backend = FactoryBot.create(:flash_card_category, name: "Backend", colour: "#f00",)
dev_ops = FactoryBot.create(:flash_card_category, name: "DevOps", colour: "#00f")

web_conventions = FactoryBot.create(:flash_card_sub_category, name: "Web Conventions", flash_card_category: frontend)
FactoryBot.create(:flash_card_sub_category, name: "Backend", flash_card_category: backend)
dev_ops_generic = FactoryBot.create(:flash_card_sub_category, name: "DevOps", flash_card_category: dev_ops)

FactoryBot.create(:flash_card,
  flash_card_sub_category: web_conventions,
  question: "What is W3C",
  answer: "World Wide Web Consortium World Wide Web Consortium World Wide Web Consortium World Wide Web Consortium World Wide Web Consortium World Wide Web Consortium World Wide Web ConsortiumWorld Wide Web Consortium World Wide Web Consortium World Wide Web Consortium"
)

FactoryBot.create(:flash_card,
  flash_card_sub_category: web_conventions,
  question: "What is SEO",
  answer: "Search Engineer Optimization"
)

FactoryBot.create(:flash_card,
  flash_card_sub_category: dev_ops_generic,
  question: "What does TCP stand for",
  answer: "Transmission Control Protocol"
)

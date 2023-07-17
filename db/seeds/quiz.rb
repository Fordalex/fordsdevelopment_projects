# db/seeds.rb

# Clear existing flash cards and flash card categories (optional)
FlashCard.destroy_all
FlashCardCategory.destroy_all

# Create root categories
root_category1 = FlashCardCategory.create(name: "Science")
root_category2 = FlashCardCategory.create(name: "History")
root_category3 = FlashCardCategory.create(name: "Geography")

# Create child categories
child_category1 = root_category1.children.create(name: "Biology")
child_category2 = root_category1.children.create(name: "Chemistry")
child_category3 = root_category2.children.create(name: "Ancient History")
child_category4 = root_category2.children.create(name: "Modern History")
child_category5 = root_category3.children.create(name: "World Geography")
child_category6 = root_category3.children.create(name: "Physical Geography")

# Create nested categories
sub_child_category1 = child_category1.children.create(name: "Cell Biology")
sub_child_category2 = child_category1.children.create(name: "Genetics")
sub_child_category3 = child_category2.children.create(name: "Organic Chemistry")
sub_child_category4 = child_category2.children.create(name: "Inorganic Chemistry")
sub_child_category5 = child_category3.children.create(name: "Roman Empire")
sub_child_category6 = child_category3.children.create(name: "Greek Civilization")
sub_child_category7 = child_category4.children.create(name: "World War I")
sub_child_category8 = child_category4.children.create(name: "Cold War")
sub_child_category9 = child_category5.children.create(name: "Countries and Capitals")
sub_child_category10 = child_category5.children.create(name: "Landforms")
sub_child_category11 = child_category6.children.create(name: "Climate")
sub_child_category12 = child_category6.children.create(name: "Ecosystems")

# Create flash cards associated with categories
FactoryBot.create(:flash_card, flash_card_category: root_category1, question: "What is DNA?", answer: "DNA is a molecule that carries genetic information.")
FactoryBot.create(:flash_card, flash_card_category: child_category1, question: "What is a cell?", answer: "A cell is the basic structural and functional unit of all living organisms.")
FactoryBot.create(:flash_card, flash_card_category: sub_child_category1, question: "What is the nucleus?", answer: "The nucleus is a membrane-bound organelle that contains the DNA of a cell.")
FactoryBot.create(:flash_card, flash_card_category: root_category2, question: "What was the Renaissance?", answer: "The Renaissance was a period of cultural and intellectual rebirth in Europe.")
FactoryBot.create(:flash_card, flash_card_category: child_category4, question: "What was the Industrial Revolution?", answer: "The Industrial Revolution was a period of major industrialization in the 18th and 19th centuries.")
FactoryBot.create(:flash_card, flash_card_category: sub_child_category7, question: "When did World War I start?", answer: "World War I started in 1914.")


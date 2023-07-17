# db/seeds.rb

# Clear existing flash cards and flash card categories (optional)
FlashCard.destroy_all
FlashCardCategory.destroy_all

# Create root categories
root_category1 = FlashCardCategory.create(name: "Science", colour: "#FF0000")
root_category2 = FlashCardCategory.create(name: "History", colour: "#00FF00")
root_category3 = FlashCardCategory.create(name: "Geography", colour: "#0000FF")

# Create child categories
child_category1 = root_category1.children.create(name: "Biology", colour: "#FFFF00")
child_category2 = root_category1.children.create(name: "Chemistry", colour: "#00FFFF")
child_category3 = root_category2.children.create(name: "Ancient History", colour: "#FF00FF")
child_category4 = root_category2.children.create(name: "Modern History", colour: "#FFA500")
child_category5 = root_category3.children.create(name: "World Geography", colour: "#008000")
child_category6 = root_category3.children.create(name: "Physical Geography", colour: "#800080")

# Create nested categories
sub_child_category1 = child_category1.children.create(name: "Cell Biology", colour: "#FFC0CB")
sub_child_category2 = child_category1.children.create(name: "Genetics", colour: "#FFD700")
sub_child_category3 = child_category2.children.create(name: "Organic Chemistry", colour: "#008080")
sub_child_category4 = child_category2.children.create(name: "Inorganic Chemistry", colour: "#FF1493")
sub_child_category5 = child_category3.children.create(name: "Roman Empire", colour: "#CD5C5C")
sub_child_category6 = child_category3.children.create(name: "Greek Civilization", colour: "#4169E1")
sub_child_category7 = child_category4.children.create(name: "World War I", colour: "#800000")
sub_child_category8 = child_category4.children.create(name: "Cold War", colour: "#808000")
sub_child_category9 = child_category5.children.create(name: "Countries and Capitals", colour: "#ADFF2F")
sub_child_category10 = child_category5.children.create(name: "Landforms", colour: "#FF4500")
sub_child_category11 = child_category6.children.create(name: "Climate", colour: "#8B008B")
sub_child_category12 = child_category6.children.create(name: "Ecosystems", colour: "#2E8B57")

# Create flash cards associated with categories
FactoryBot.create(:flash_card, title: "DNA", flash_card_category: root_category1, question: "What is DNA?", answer: "DNA is a molecule that carries genetic information.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "AASDF", flash_card_category: root_category1, question: "What is DNA?", answer: "DNA is a molecule that carries genetic information.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "Random", flash_card_category: root_category1, question: "What is DNA?", answer: "DNA is a molecule that carries genetic information.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "More", flash_card_category: root_category1, question: "What is DNA?", answer: "DNA is a molecule that carries genetic information.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "Cell", flash_card_category: child_category1, question: "What is a cell?", answer: "A cell is the basic structural and functional unit of all living organisms.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "Nucleus", flash_card_category: sub_child_category1, question: "What is the nucleus?", answer: "The nucleus is a membrane-bound organelle that contains the DNA of a cell.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "Renaissance", flash_card_category: root_category2, question: "What was the Renaissance?", answer: "The Renaissance was a period of cultural and intellectual rebirth in Europe.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "Industrial Revolution", flash_card_category: child_category4, question: "What was the Industrial Revolution?", answer: "The Industrial Revolution was a period of major industrialization in the 18th and 19th centuries.", correct: rand(10), incorrect: rand(10))
FactoryBot.create(:flash_card, title: "Start of WWI", flash_card_category: sub_child_category7, question: "When did World War I start?", answer: "World War I started in 1914.", correct: rand(10), incorrect: rand(10))

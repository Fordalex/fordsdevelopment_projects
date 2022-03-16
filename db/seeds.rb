# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.delete_all
Feature.delete_all
Technology.delete_all
TechnologyGroup.delete_all

ruby = Technology.create!(
  name: "Ruby",
  icon: "icons/ruby.png"
)

html = Technology.create!(
  name: "HTML5",
  icon: "icons/html5.png"
)

css = Technology.create!(
  name: "CSS3",
  icon: "icons/css3.png"
)

javascript = Technology.create!(
  name: "Javascript",
  icon: "icons/javascript.png"
)

django = Technology.create!(
  name: "Django",
  icon: "icons/django.png"
)

ai = Technology.create!(
  name: "AI",
  icon: "icons/ai.png"
)

blender = Technology.create!(
  name: "blender",
  icon: "icons/blender.png"
)

mongodb = Technology.create!(
  name: "mongodb",
  icon: "icons/mongodb.png"
)

fordsdevelopment = Project.create!(
  name: "Fordsdevelopment",
  link: "https://fordsdevelopment.co.uk",
  started: Date.new(2021,10,01),
  description: "My website",
  ux: "Some information about the ux",
  features_left_to_implement: "Tonnes",
  current_features: "maybe change to an association?",
  acknowledgements: "Again maybe an association?",
  image: "logos/fordsdevelopment.svg"
)

family_organiser = Project.create!(
  name: "Family Organiser",
  link: "https://fordsdevelopment.co.uk",
  started: Date.new(2021,10,01),
  description: "My website",
  ux: "Some information about the ux",
  features_left_to_implement: "Tonnes",
  current_features: "maybe change to an association?",
  acknowledgements: "Again maybe an association?",
  image: "projects/family_organiser.png"
)

the_note_worthy = Project.create!(
  name: "TheNoteWorthy",
  link: "https://thenoteworthy.fordsdevelopment.co.uk",
  started: Date.new(2021,10,01),
  description: "My website",
  ux: "Some information about the ux",
  features_left_to_implement: "Tonnes",
  current_features: "maybe change to an association?",
  acknowledgements: "Again maybe an association?"
)

calendar = Project.create!(
  name: "Calendar",
  link: "https://fordsdevelopment.co.uk",
  started: Date.new(2021,10,01),
  description: "My website",
  ux: "Some information about the ux",
  features_left_to_implement: "Tonnes",
  current_features: "maybe change to an association?",
  acknowledgements: "Again maybe an association?"
)

Feature.create!(
  name: "Contact",
  description: "Multi-part form",
  started: Date.new(2021,01,01),
  project: fordsdevelopment
)

TechnologyGroup.create!(
  technology: html,
  project: fordsdevelopment,
)

TechnologyGroup.create!(
  technology: ruby,
  project: fordsdevelopment,
)

TechnologyGroup.create!(
  technology: css,
  project: fordsdevelopment,
)

TechnologyGroup.create!(
  technology: javascript,
  project: fordsdevelopment,
)

TechnologyGroup.create!(
  technology: django,
  project: fordsdevelopment,
)

TechnologyGroup.create!(
  technology: mongodb,
  project: fordsdevelopment,
)

# I think add a polymorphic model Info

# CURRENT_FEATURE = "Current Feature"
# FUTURE_FEATURE = "Future Feature"
# ACKNOWLEDGEMENT = "Acknowledgement"

# has_many :current_features, class_name: "Info", category: CURRENT_FEATURE
# has_many :future_features, class_name: "Info"
# has_many :acknowledgements, class_name: "Info"


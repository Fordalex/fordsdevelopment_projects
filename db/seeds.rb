# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.delete_all
Feature.delete_all

fordsdevelopment = Project.create!(
  name: "Fordsdevelopment",
  link: "https://fordsdevelopment.co.uk",
  started: Date.new(2021,10,01),
  description: "My website",
  ux: "Some information about the ux",
  features_left_to_implement: "Tonnes",
  current_features: "maybe change to an association?",
  acknowledgements: "Again maybe an association?"
)

contact = Feature.create!(
  name: "Contact",
  description: "Multi-part form",
  started: Date.new(2021,01,01),
  project: fordsdevelopment
)

# I think add a polymorphic model Info

# CURRENT_FEATURE = "Current Feature"
# FUTURE_FEATURE = "Future Feature"
# ACKNOWLEDGEMENT = "Acknowledgement"

# has_many :current_features, class_name: "Info", category: CURRENT_FEATURE
# has_many :future_features, class_name: "Info"
# has_many :acknowledgements, class_name: "Info"


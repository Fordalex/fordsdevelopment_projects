class FlashCardCategory < ApplicationRecord
  acts_as_tree
  has_many :flash_cards

  def to_param
    name
  end

  def total_flash_cards_count
    flash_cards_count = flash_cards.count

    children.each do |child|
      flash_cards_count += child.total_flash_cards_count
    end

    flash_cards_count
  end

  def total_correct_answers_count
    correct_answers_count = flash_cards.sum(:correct)

    children.each do |child|
      correct_answers_count += child.total_correct_answers_count
    end

    correct_answers_count
  end

  def total_incorrect_answers_count
    incorrect_answers_count = flash_cards.sum(:incorrect)

    children.each do |child|
      incorrect_answers_count += child.total_incorrect_answers_count
    end

    incorrect_answers_count
  end

  def score
    total_flash_cards = flash_cards.count

    return 0 if total_flash_cards.zero?

    total_score = flash_cards.sum do |flash_card|
      flash_card.score.to_f
    end

    average_score = total_score / total_flash_cards
    average_score.round(2)
  end


  def total_flash_cards
    flash_cards.count
  end

  def correct_flash_cards
    flash_cards.sum(&:correct)
  end

  def incorrect_flash_cards
    flash_cards.sum(&:incorrect)
  end

  def self.ordered_by_score
    all.sort_by(&:score).reverse
  end

  def self.root_categories_ordered_by_score
    roots.sort_by(&:score).reverse
  end
end

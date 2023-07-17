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
    total_correct = total_correct_answers_count
    total_incorrect = total_incorrect_answers_count
    total_attempts = total_correct + total_incorrect

    return 0 if total_attempts.zero?

    # calculate the basic score
    basic_score = (total_correct.to_f / total_attempts) * 100

    # get the number of days since last updated
    days_since_update = (Time.current - self.updated_at) / (60 * 60 * 24)

    # calculate the time penalty (0 to 1, where 0 means it was updated today and 1 means it was updated more than 30 days ago)
    time_penalty = [days_since_update / 30.0, 1].min

    # apply the time penalty to the score
    final_score = basic_score * (1 - time_penalty)

    final_score.round(2)
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

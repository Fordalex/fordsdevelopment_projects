class FlashCard < ApplicationRecord
  belongs_to :flash_card_category

  def score
    total_attempts = correct + incorrect

    return 0 if total_attempts.zero?

    # calculate the basic score
    basic_score = (correct.to_f / total_attempts) * 100

    # get the number of days since last updated
    days_since_update = (Time.current - updated_at) / (60 * 60 * 24)

    # calculate the time penalty (0 to 1, where 0 means it was updated today and 1 means it was updated more than 30 days ago)
    time_penalty = [days_since_update / 30.0, 1].min

    # apply the time penalty to the score
    final_score = basic_score * (1 - time_penalty)

    final_score.round(2)
  end
end

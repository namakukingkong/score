class League < ApplicationRecord
  after_create :calculate_score

  private

  def calculate_score
    ho_club            = Team.find(self.home_club)
    aw_club            = Team.find(self.away_club)
    ho_score, aw_score = self.score.split(":")
    if ho_score.to_i.eql?(aw_score.to_i)
      ho_club.update(score: ho_club.score.to_i + 1) # draw
      aw_club.update(score: aw_club.score.to_i + 1) # draw
    elsif ho_score.to_i > aw_score.to_i
      ho_club.update(score: ho_club.score.to_i + 3) #win
    elsif ho_score.to_i < aw_score.to_i
      aw_club.update(score: aw_club.score.to_i + 3) #win
    end
  end
end

class Team < ApplicationRecord
  def self.sum_score
    Team.all.map { |t| { t.title => t.score } }
  end

  def self.get_rank(rank)
    teams = Team.all
    if teams.size > rank
      Team.all.order(score: "DESC")[rank - 1].title
    else
      "Ha ha"
    end
  end
end

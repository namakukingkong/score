require 'rails_helper'

describe League do
  describe '.all' do
    it 'all true results' do
      arsenal   = create :team, title: "Arsenal", score: 0
      chelsea   = create :team, title: "Chelsea", score: 0
      liverpool = create :team, title: "Liverpool", score: 0

      create :league, home_club: arsenal.id, away_club: chelsea.id, score: "2:1"
      create :league, home_club: arsenal.id, away_club: chelsea.id, score: "1:1"
      create :league, home_club: chelsea.id, away_club: arsenal.id, score: "0:3"
      create :league, home_club: chelsea.id, away_club: liverpool.id, score: "3:2"
      create :league, home_club: liverpool.id, away_club: arsenal.id, score: "2:2"
      create :league, home_club: liverpool.id, away_club: chelsea.id, score: "0:0"
      expect(League.all.size).to eq(6)
      expect(Team.all.size).to eq(3)
      expect(Team.pluck(:title)).to eq(["Arsenal", "Liverpool", "Chelsea"])
      expect(Team.sum_score).to eq([{ "Arsenal" => "8" }, { "Liverpool" => "2" }, { "Chelsea" => "5" }])
      expect(Team.get_rank(2)).to eq("Chelsea")
      expect(Team.get_rank(1)).to eq("Arsenal")
      expect(Team.get_rank(5)).to eq("Ha ha")
    end

  end

end

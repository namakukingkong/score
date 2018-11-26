require 'rails_helper'

describe MatchString do
  describe '.containLetters' do
    it 'containLetters true' do
      results = described_class.containLetters("cat", "antarctica")
      expect(results).to eq(true)
    end
    it 'containLetters true' do
      results = described_class.containLetters("CAT", "antarctica")
      expect(results).to eq(true)
    end
    it 'containLetters true' do
      results = described_class.containLetters("cat", "ANTARCTICA")
      expect(results).to eq(true)
    end
    it 'containLetters false' do
      results = described_class.containLetters("cat", "australia")
      expect(results).to eq(false)
    end
    it 'containLetters false' do
      results = described_class.containLetters("dog", "ANTARCTICA")
      expect(results).to eq(false)
    end
  end

end

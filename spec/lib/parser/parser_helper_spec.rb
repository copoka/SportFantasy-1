require 'rails_helper'
require 'parser/parser_helper'

RSpec.describe ParserHelper , :type => :helper do
  context '#calculate_price' do
    it 'calculate price correctly' do
      expect(helper.calculate_price [3, 6, 9]).to eq 10_300_000
    end
    it 'calculate price correctly with float values' do
      expect(helper.calculate_price [4, 5, 6]).to eq 10_250_000
    end
    it 'calculate price correctly with big float values' do
      expect(helper.calculate_price [228, 147, 97]).to eq 17_866_666
    end
  end
end
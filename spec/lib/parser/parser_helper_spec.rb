require 'rails_helper'
require 'parser/parser_helper'

RSpec.describe ParserHelper , :type => :helper do
  context '#calculate_price' do
    it 'calculate price correctly' do
      expect(helper.calculate_price [3, 6, 9]).to eq 10_300_000
    end
  end
end
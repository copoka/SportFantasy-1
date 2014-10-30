module ParserHelper
  # массив очков из n(3-4) прошлых сезонов
  def calculate_price(past_score)
    me = past_score.inject(0) { |sym, n| sym + n/past_score.size.to_f }
    10_000_000 + (me * 50_000).to_i
  end
end
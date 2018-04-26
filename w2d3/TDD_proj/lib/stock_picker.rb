def stock_picker(array)
  most_profit = 0
  ans = []
  (0...array.length-1).each do |buy_day|
    (buy_day+1..array.length-1).each do |sell_day|
      profit = array[sell_day] - array[buy_day]
      if  profit > most_profit
        most_profit = profit
        ans = [buy_day, sell_day]
      end
    end
  end
  ans
end

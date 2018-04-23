require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
begin
sam = BestFriend.new('', 1, '')
rescue YearsError => e
  puts e.message
  retry
end
sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet

class YearsError < ArgumentError
  def message
    "We can only be best friends if we've known each other for 5 years, bro."
  end
end

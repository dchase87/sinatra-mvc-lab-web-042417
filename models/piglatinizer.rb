class PigLatinizer
  attr_accessor :words

  def initialize
    @words = []
  end

  def piglatinize(word)
    array = word.split('')
    if ["a", "e", "i", "o", "u"].include?(array[0].downcase)
      new_array = [*array, *["w", "a", "y"]].join
    elsif word.downcase.start_with?("th")
      new_array = [*array.slice(2..900), *["t", "h", "a", "y"]].join
    elsif word.downcase.start_with?("spr")
      new_array = [*array.slice(3..900), *["s", "p", "r", "a", "y"]].join
    elsif word.downcase.start_with?("pr")
      new_array = [*array.slice(2..900), *["p", "r", "a", "y"]].join
    elsif word.downcase.start_with?("pl")
      new_array = [*array.slice(2..900), *["p", "l", "a", "y"]].join
    elsif word.downcase.start_with?("wh")
      new_array = [*array.slice(2..900), *["w", "h", "a", "y"]].join
    else
      new_array = [*array.slice(1..900), *[array[0], "a", "y"]].join
    end
  end

  def to_pig_latin(sentence)
    array = sentence.split(" ")
    new_array = []
    if array.all? {|word| word.end_with?("ay")}
      sentence
    else
      array.each do |word|
      new_array << piglatinize(word)
      end
      new_array.join(' ')
    end
  end

end

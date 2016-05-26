require "./lib/characters"

class NightRead
  attr_reader :characters

  def initialize
    @characters = Characters.new
  end

  def decode_to_latin(input)
    braille = parsing_back_into_three_lines(input)
    latin_elements = finding_x_axis_pairs(braille)
    output = assign_braille_key_to_latin_value(latin_elements)
  end

  def parsing_back_into_three_lines(input)
    string_lines = []
    current_value = 0
    temp_array = input.split("\n")
    next_value = 3
    until temp_array.count == 3
      temp_array[current_value] += temp_array[next_value]
      temp_array.delete_at(next_value)
      if current_value == 2
        current_value = 0
      else
        current_value += 1
      end
    end
    input = temp_array
  end

  def finding_x_axis_pairs(input)
    input.map do |elements|
      elements.scan(/../)
    end.transpose
  end

  def assign_braille_key_to_latin_value(input)
    input.map do |letter|
      braille_latin = characters.latin_braille.invert
      braille_latin[letter]
    end.join
  end
end

if __FILE__ == $0
  braille_text = File.read(ARGV[0])
  night_read = NightRead.new
  output = night_read.decode_to_latin(braille_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{braille_text.chomp.length / 6} characters"
end

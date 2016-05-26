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
    starting_index = 0
    braille_lines = input.split("\n")
    index_to_join = 3
    until braille_lines.count == 3
      braille_lines[starting_index] += braille_lines[index_to_join]
      braille_lines.delete_at(index_to_join)
      if starting_index == 2
        starting_index = 0
      else
        starting_index += 1
      end
    end
    input = braille_lines
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
  puts "Created '#{ARGV[1]}' containing #{(braille_text.chomp.length / 6) + 3} characters"
end

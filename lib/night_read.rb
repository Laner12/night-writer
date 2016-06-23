require "./lib/characters"

class NightRead
  attr_reader :characters
  attr_accessor :output

  def initialize
    @characters = Characters.new
    @output = ""
  end

  def decode_to_latin(input)
    braille = parsing_back_into_three_lines(input)
    latin_elements = finding_x_axis_pairs(braille)
    final_format = combine_for_translation(latin_elements)
    assign_braille_key_to_latin_value(final_format)
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
    input.map do |letter_fragments|
      letter_fragments.scan(/../)
    end.transpose
  end

  def combine_for_translation(input)
    input.map do |letter|
      letter.join
    end
  end

  def assign_braille_key_to_latin_value(input)
    index = 0
    next_index = index + 1
    until index == input.length
      if input[index] == ".....0"
        input[next_index] = input[index] + input[next_index]
      elsif input[index] == ".0.000"
        input[next_index] = input[index] + input[next_index]
      else
        @output += characters.braille_latin[input[index]]
      end
      index += 1
      next_index += 1
    end
    @output
  end
end

if __FILE__ == $0
  braille_text = File.read(ARGV[0])
  night_read = NightRead.new
  output = night_read.decode_to_latin(braille_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{(braille_text.chomp.length / 6) + 3} characters"
end

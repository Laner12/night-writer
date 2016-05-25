require "./lib/characters"

class NightWrite
  attr_reader :characters

  def initialize
    @characters = Characters.new
  end

  def encode_to_braille(string)
    indices = input_to_array(string)
    braille_letter = assign_latin_key_to_braille_value(indices)
    braille_letter_line = parse_by_braille_letter_index(braille_letter)
    output = format_letter_to_three_lines(braille_letter_line)
  end

  def input_to_array(input)
    input.to_s.chars
  end

  def assign_latin_key_to_braille_value(input)
    input.map do |letter|
      characters.latin_braille[letter]
    end
  end

  def parse_by_braille_letter_index(input)
    input.transpose
  end

  def format_letter_to_three_lines(input)
    lines = []
    3.times do |i|
      lines << input[i].join
    end
    lines.join("\n")
  end
end

if __FILE__ == $0
  latin_text = File.read(ARGV[0]).chomp
  night_write = NightWrite.new
  output = night_write.encode_to_braille(latin_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{latin_text.chomp.length} characters"
end

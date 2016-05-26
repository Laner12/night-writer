require "./lib/characters"

class NightRead
  attr_reader :characters

  def initialize
    @characters = Characters.new
  end

  def decode_to_latin(braille)
    braille_lines = input_to_array(braille)
    latin_elements = finding_x_axis_pairs(braille_lines)
    output = assign_braille_key_to_latin_value(latin_elements)
  end

  def input_to_array(input)
    input.split("\n")
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
  braille_text = File.read(ARGV[0]).chomp
  night_read = NightRead.new
  output = night_read.decode_to_latin(braille_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{braille_text.chomp.length / 6} characters"
end

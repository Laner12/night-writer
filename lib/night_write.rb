require "./lib/characters"
require "pry"
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
    output_to_file(output)
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
    lines
  end

  def output_to_file(input)
    string = ""
    while input[0].length > 80
      input.each do |line_chunks|
        line = line_chunks.slice!(0..79)
        string << line + "\n"
      end
    end
    string
  end
end

if __FILE__ == $0
  latin_text = File.read(ARGV[0]).chomp
  night_write = NightWrite.new
  output = night_write.encode_to_braille(latin_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{latin_text.chomp.length} characters"
end

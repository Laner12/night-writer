require "./lib/file_reader"
require "./lib/characters"

class NightWrite
  attr_reader :reader,
              :characters

  def initialize
    @reader = FileReader.new
    @characters = Characters.new
  end

  def encode_file_to_braille
    plain = reader.read.chomp
    braille = encode_to_braille(plain)
    File.open(ARGV[1], 'w') { |file| file.write(braille) }
    puts "Created '#{ARGV[1]}' containing #{plain.chomp.length} characters"
  end

  def encode_to_braille(input)
    elements = input.to_s.chars
    braille_elements = elements.map do |letter|
      characters.latin_braille[letter]
    end.transpose
    line_1 = braille_elements[0].join
    line_2 = braille_elements[1].join
    line_3 = braille_elements[2].join
    "#{line_1}\n#{line_2}\n#{line_3}\n\n"
  end
end

night = NightWrite.new
puts night.encode_file_to_braille

require "./lib/characters"
# require "./lib/file_reader"

class NightWrite
  attr_reader :characters
              # :reader

  def initialize
    # @reader = FileReader.new
    @characters = Characters.new
  end

  # def encode_file_to_braille
  #   plain = reader.read.chomp
  #   braille = encode_to_braille(plain)
  #   File.open(ARGV[1], 'w') { |file| file.write(braille) }
  #   puts "Created '#{ARGV[1]}' containing #{plain.chomp.length} characters"
  # end

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

if __FILE__ == $0
  latin_text = File.read(ARGV[0]).chomp
  night_write = NightWrite.new
  output = night_write.encode_to_braille(latin_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{latin_text.chomp.length} characters"
end

# if __FILE__ == $0
#   night = NightWrite.new
#   puts night.encode_file_to_braille
# end

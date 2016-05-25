require "./lib/characters"
# require "./lib/file_reader"

class NightRead
  attr_reader :characters
              # :reader

  def initialize
    # @reader = FileReader.new
    @characters = Characters.new
  end

  # def decode_file_to_latin
  #   plain = reader.read.chomp
  #   latin = decode_to_latin(plain)
  #   File.open(ARGV[1], 'w') { |file| file.write(latin) }
  #   puts "Created '#{ARGV[1]}' containing #{plain.chomp.length / 6} characters"
  # end

  def decode_to_latin(input)
    braille_lines = input.split("\n")
    latin_elements = braille_lines.map do |i|
      i.scan(/../)
    end.transpose
    output = latin_elements.map do |i|
      braille_latin = characters.latin_braille.invert
      braille_latin[i]
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

require "./lib/file_reader"
require "./lib/file_writer"
require "./lib/characters"
require "pry"

class NightWriter
  attr_reader :reader,
              :characters,
              :writer

  def initialize
    @reader = FileReader.new
    @characters = Characters.new
    # @writer = FileWriter.new
  end

  def encode_file_to_braille
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = reader.read.chomp
    braille = encode_to_braille(plain)
    # File.write(ARGV[1], braille)
    File.open(ARGV[1], 'w') { |file| file.write(braille) }
    # binding.pry
    puts "Created '#{ARGV[1]}' containing #{plain.chomp.length} characters"
  end

  def encode_to_braille(input)
    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
    elements = input.to_s.chars
    # needs an upcase if statement
    braille_elements = elements.map do |letter|
      characters.latin_braille[letter]
    end.transpose
    line_1 = braille_elements[0].join
    line_2 = braille_elements[1].join
    line_3 = braille_elements[2].join
    "#{line_1}\n#{line_2}\n#{line_3}\n\n"
  end
end

# class Start
#   def initialize
#     @night_write = NightWriter.new
#     @night_read = NightRead.new
#   end
#
#   def write
#     @night_write.encode_file_to_braille
#   end
#
#   def read
#     @night_read.decrypt_file_to_english
#   end
# end

night = NightWriter.new
# input = "this is difficult"
# night.encode_to_braille(input)
puts night.encode_file_to_braille

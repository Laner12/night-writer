require "./lib/characters"
require "pry"

class NightRead
  attr_reader :characters

  def initialize
    @characters = Characters.new
  end

  def decode_to_latin(input)
    braille = parsing_back_into_three_lines(input)
    latin_elements = finding_x_axis_pairs(braille)
    latin_without_caps = standardize_letters(latin_elements)
    output = assign_braille_key_to_latin_value(latin_elements)
    binding.pry
    final = final_format_for_output(output)
    final.join
  end

  def parsing_back_into_three_lines(input)
    # starting_index = 0
    braille_lines = input.split("\n")
    # index_to_join = 3
    # until braille_lines.count == 3
    #   braille_lines[starting_index] += braille_lines[index_to_join]
    #   braille_lines.delete_at(index_to_join)
    #   if starting_index == 2
    #     starting_index = 0
    #   else
    #     starting_index += 1
    #   end
    # end
    input = braille_lines
  end

  def finding_x_axis_pairs(input)
    input.map do |elements|
      elements.scan(/../)
    end.transpose
  end

  def standardize_letters(input)
    indices = []
    input.each_with_index { |letter, index| indices << index if letter == ["..", "..", ".0"]}
    # input.reject {|i| i == ["..", "..", ".0"]}
    indices
  end

  def assign_braille_key_to_latin_value(input)
    # indices = []
    # input.each_with_index { |letter, index| indices << index if letter == ["..", "..", ".0"]}
    deleted = input.reject {|i| i == ["..", "..", ".0"]}
    # indices.each {|x| input[]}
     deleted.map do |letter|
      braille_latin = characters.latin_braille.invert
      braille_latin[letter]
      # maybe put and if else here or make it refer to a secondatary map
      # look at having a module for the map going both ways in addition to one for the num and other bs
      # if the first three are x then return the upcase same with num
      # cap_map[letter]  if letter == ["..", "..", ".0"]
      # cap_map for the next letter
      #cap_map[letter] if index -1 == ["..", "..", ".0"]
    end
    # iterate over letters and capitalize every number located at an index in indices
  end

  def final_format_for_output(output)
    collection = output.chars
    collection.map do |character|
      if collection.include?("^")
        index = collection.index{|x| x == "^"}
        collection.delete_at(index)
        collection[index].upcase! #unless collection[index] == collection.count
      else
        character
      end
    end
  end
end

if __FILE__ == $0
  braille_text = File.read(ARGV[0])
  night_read = NightRead.new
  output = night_read.decode_to_latin(braille_text)
  File.write(ARGV[1], output)
  puts "Created '#{ARGV[1]}' containing #{(braille_text.chomp.length / 6) + 3} characters"
end
# def final_format_for_output(output)
#   collection = output.chars
#   collection.map do |character|
#     if collection.include?("^")
#       index = collection.index{|x| x == "^"}
#       collection.delete_at(index)
#       collection[index].upcase! #unless collection[index] == collection.count
#     else
#       character
#     end
#   end
# end

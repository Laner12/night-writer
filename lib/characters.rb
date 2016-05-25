class Characters
  attr_reader :latin_braille

  def initialize
    @latin_braille = Hash.new
      latin_braille["#"] = [".0", ".0", "00"]
      latin_braille["0"] = [".0", "00", ".."]
      latin_braille["1"] = ["0.", "..", ".."]
      latin_braille["2"] = ["0.", "0.", ".."]
      latin_braille["3"] = ["00", "..", ".."]
      latin_braille["4"] = ["00", ".0", ".."]
      latin_braille["5"] = ["0.", ".0", ".."]
      latin_braille["6"] = ["00", "0.", ".."]
      latin_braille["7"] = ["00", "00", ".."]
      latin_braille["8"] = ["0.", "00", ".."]
      latin_braille["9"] = [".0", "0.", ".."]
      latin_braille["a"] = ["0.", "..", ".."]
      latin_braille["b"] = ["0.", "0.", ".."]
      latin_braille["c"] = ["00", "..", ".."]
      latin_braille["d"] = ["00", ".0", ".."]
      latin_braille["e"] = ["0.", ".0", ".."]
      latin_braille["f"] = ["00", "0.", ".."]
      latin_braille["g"] = ["00", "00", ".."]
      latin_braille["h"] = ["0.", "00", ".."]
      latin_braille["i"] = [".0", "0.", ".."]
      latin_braille["j"] = [".0", "00", ".."]
      latin_braille["k"] = ["0.", "..", "0."]
      latin_braille["l"] = ["0.", "0.", "0."]
      latin_braille["m"] = ["00", "..", "0."]
      latin_braille["n"] = ["00", ".0", "0."]
      latin_braille["o"] = ["0.", ".0", "0."]
      latin_braille["p"] = ["00", "0.", "0."]
      latin_braille["q"] = ["00", "00", "0."]
      latin_braille["r"] = ["0.", "00", "0."]
      latin_braille["s"] = [".0", "0.", "0."]
      latin_braille["t"] = [".0", "00", "0."]
      latin_braille["u"] = ["0.", "..", "00"]
      latin_braille["v"] = ["0.", "0.", "00"]
      latin_braille["w"] = [".0", "00", ".0"]
      latin_braille["x"] = ["00", "..", "00"]
      latin_braille["y"] = ["00", ".0", "00"]
      latin_braille["z"] = ["0.", ".0", "00"]
      latin_braille["!"] = ["..", "00", "0."]
      latin_braille["'"] = ["..", "..", "0."]
      latin_braille[","] = ["..", "0.", ".."]
      latin_braille["-"] = ["..", "..", "00"]
      latin_braille["."] = ["..", "00", ".0"]
      latin_braille["?"] = ["..", "0.", "00"]
      latin_braille["Shift"] = ["..", "..", ".0"]
      latin_braille[" "] = ["..", "..", ".."]
      # play with adding \n and parsing
      # latin_braille["A"] = ["..", "..", ".0", ".0", ".0", "00"]
  end
end

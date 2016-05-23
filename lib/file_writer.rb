class FileWriter

  def write
    filename = ARGV[1]
    File.open(filename, "w")
  end
end

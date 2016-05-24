require "./test/testhelper"
require "./lib/night_write"

class NightWriteTest < Minitest::Test

  def test_it_exists
    night = NightWrite.new

    assert_instance_of NightWrite, night
  end

  def test_it_has_access_to_the_characters
    night = NightWrite.new

    assert_instance_of Characters, night.characters
  end

  def test_it_reads_a_text_file
    night = NightWrite.new
    reader = FileReader.new

    assert_instance_of FileReader, reader
  end

  def test_a_file_exists
    skip
    assert true, File.exists?(ARGV[0])
  end

  def test_it_can_convert_a_single_letter
    skip
    night = NightWrite.new
    answer = ".."
    assert_equal answer, night.encode_to_braille("a")
  end
end

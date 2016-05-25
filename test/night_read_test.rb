require "./test/testhelper"
require "./lib/night_read"

class NightReadTest < Minitest::Test

  def test_it_exists
    night = NightRead.new

    assert_instance_of NightRead, night
  end

  def test_it_has_access_to_the_characters
    night = NightRead.new

    assert_instance_of Characters, night.characters
  end
end

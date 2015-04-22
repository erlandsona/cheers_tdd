require_relative 'helper'

class TestCheersIntegration < Minitest::Test

  def test_1_0_zero_args_returns_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_1_1_valid_arg
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A!
Give me a ... B!
Give me a ... B!
Give me a ... Y!
Abby is just GRAND!
EOS
    assert_equal expected, output
  end

  def test_1_2_valid_with_hyphen_double_name
    output = `./cheers Abby-Dawn`
    expected = <<EOS
Give me an... A!
Give me a ... B!
Give me a ... B!
Give me a ... Y!
Give me a ... D!
Give me an... A!
Give me a ... W!
Give me an... N!
Abby-Dawn is just GRAND!
EOS
    assert_equal expected, output
  end

  def test_1_3_valid_with_special_characters
    output = `./cheers Bênção`
    expected = <<EOS
Give me a ... B!
Give me an... Ê!
Give me an... N!
Give me a ... Ç!
Give me an... Ã!
Give me an... O!
Bênção is just GRAND!
EOS
    assert_equal expected, output
  end

  def test_1_4_args_contain_wierd_characters
    output = `./cheers 2736jka@#!%`
    expected = <<EOS
I'd cheer for you, if only I knew your real name :(
Try again with `./cheers [Name] [MM/DD Birthday]`
Remember to try and avoid typing any special characters
EOS
    assert_equal expected, output
  end

# This will break our program and there's not a good way to make this work either:/

  def test_1_5_name_includes_proper_roman_numeral
    output = `./cheers "Bob White Sr. III"`
    expected = <<EOS
Give me a ... B!
Give me an... O!
Give me a ... B!
Give me a ... W!
Give me an... H!
Give me a ... W!
Give me an... H!
Give me an... I!
Give me a ... T!
Give me an... E!
EOS
    assert_equal expected, output
  end

  def test_1_6_name_includes_improper_roman_numeral
    output = `./cheers "Bob White Sr. IIII"`
    expected = <<EOS
Please type in a proper Roman Numeral:) Thanks!
EOS
    assert_equal expected, output
  end

  # Scenarios discussed in class:
  # 0 args -> help message √
  # 1 valid arg √
  # 1 invalid arg √
  # 2 args √
  #   * valid + valid √
  #   * valid + invalid
  #   * invalid + valid
  #   * invalid + invalid
  #
  # Valid Names:
  #    * Regular name
  #    * Name with hyphens
  # Invalid Names:
  #   * birthday instead of name
  #   * all non-word characters
  #   * "" (empty string)
  #   * "  " (whitespace)
  # Valid Months:
  #   * m/dd (8/25)
  #   * mm/dd (08/25)
  #   * birthdays that already happened this year
  #   * birthdays that haven't happened yet this year
  # Invalid Months:
  #   * dd/mm (25/08)
  #   * dd/mm/yy (08/25/2015)
end

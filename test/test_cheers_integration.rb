require_relative 'helper'

class TestCheersIntegration < Minitest::Test

  def test_zero_arguments_prints_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_one_valid_argument
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_one_valid_argument
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_one_valid_argument_with_hyphenated_name
    output = `./cheers Mary-Jane`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary-Jane’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_one_valid_argument_with_double_name
    output = `./cheers "Mary Jane"`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary Jane’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_birthday_instead_of_name
    output = `./cheers 08/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_only_non_word_characters_in_name
    output = `./cheers *!?`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_no_characters_in_name
    output = `./cheers ""`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_only_whitespace_in_name
    output = `./cheers "  "`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  # Scenarios discussed in class:
  # 1 valid arg
  # 1 invalid arg
  # 2 args
  #   * valid + valid
  def test_two_valid_arguments
    skip
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday is in 127 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end
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

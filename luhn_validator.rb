# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    nums_a[-1] == (10 - (cal_checksum(nums_a) % 10)) % 10
  end

  def cal_checksum(nums_array)
    # return sum check
    nums_array.reverse[1..-1].each_with_index.reduce(0) do |start, (num, idx)|
      mul = idx.even? ? 2 * num : num
      start + mul % 10 + mul / 10
    end
  end
end

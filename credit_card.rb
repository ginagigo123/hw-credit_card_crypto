# frozen_string_literal: true

require_relative './luhn_validator'
require 'json'
require 'openssl'

# class for credit card
class CreditCard
  include LuhnValidator
  # TODO: mixin the LuhnValidator using an 'include' statement

  # instance variables with automatic getter/setter methods
  attr_accessor :number, :expiration_date, :owner, :credit_network

  def initialize(number, expiration_date, owner, credit_network)
    # TODO: initialize the instance variables listed above
    @number = number
    @expiration_date = expiration_date
    @owner = owner
    @credit_network = credit_network
  end

  # returns json string
  def to_json(*args)
    my_hash = {
      'credit card' => {
        'number' => @number,
        'expiration_date' => @expiration_date,
        'owner' => @owner,
        'credit_network' => @credit_network
      }
      # TODO: setup the hash with all instance vairables to serialize into json
    }
    JSON.generate(my_hash, *args)
  end

  # returns all card information as single string
  def to_s
    to_json
  end

  # return a new CreditCard object given a serialized (JSON) representation
  def self.from_s(card_s)
    # TODO: deserializing a CreditCard object
    JSON.parse(card_s)
  end

  # return a hash of the serialized credit card object
  def hash
    # TODO: implement this method
    #   - Produce a hash (using default hash method) of the credit card's
    #     serialized contents.
    #   - Credit cards with identical information should produce the same hash
    {
      number => @number,
      expiration_date => @expiration_date,
      owner => @owner,
      credit_network => @credit_network
    }
  end

  # return a cryptographically secure hash
  def hash_secure
    # TODO: implement this method
    #   - Use sha256 from openssl to create a cryptographically secure hash.
    #   - Credit cards with identical information should produce the same hash
    {
      number => OpenSSL::Digest.new('SHA256', @number),
      expiration_date => @expiration_date,
      owner => @owner,
      credit_network => @credit_network
    }
  end
end

require_relative 'validation'
require_relative 'acessors'

class Test

  include Validation
  extend Acessors

  #attr_accessor :barcode, :article, :number
  attr_accessor_with_history :barcode, :article, :number

  def initialize(barcode, article, number)
    @barcode = barcode
    @article = article
    @number = number
    validate!
  end

  validate :barcode, :presence
  validate :barcode, :type, String
  validate :barcode, :format, /^\d{12}/ #123456789012

  validate :article, :presence
  validate :article, :type, String
  validate :article, :format, /\d{5}/ # 12345

  validate :number, :presence
  validate :number, :type, Integer
end

p test = Test.new('123456789012', 'T-12345', 30)

# test.barcode = '123456789011z'
# test.article = 'T-12346'
# test.number = 99
# p test.valid?
# test.validate!

#  test.barcode = '123456789013'

# p test.barcode_history

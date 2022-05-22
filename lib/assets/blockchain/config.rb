NUM_ZEROES = 4
NAMES_FILE = "#{ENV['HASEEBCOIN_ROOT']}/lib/assets/blockchain/names.txt"
HUMAN_READABLE_NAMES = File.readlines(NAMES_FILE).map(&:chomp)
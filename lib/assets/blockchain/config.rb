NUMBER_OF_NONCE_ZEROES = 4
GOSSIP_TIMING = 3.seconds
NAMES_FILE = "#{ENV['HASEEBCOIN_ROOT']}/lib/assets/blockchain/names.txt"
HUMAN_READABLE_NAMES = File.readlines(NAMES_FILE).map(&:chomp)
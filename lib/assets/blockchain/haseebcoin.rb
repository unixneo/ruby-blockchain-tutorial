# Original Code from: https://github.com/Haseeb-Qureshi/lets-build-a-blockchain/
require 'sinatra'
require 'colorize'
require 'active_support/time'
require 'yaml'
require 'thread_safe'
require 'active_record'
require 'active_record'
require 'sqlite3'
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3', 
  :database => "#{ENV['HASEEBCOIN_ROOT']}/db/development.sqlite3"
)
class User < ActiveRecord::Base
end


puts "HASEEBCOIN_ROOT ENV Variable Not Defined!" if ENV['HASEEBCOIN_ROOT'].nil?


require "#{ENV['HASEEBCOIN_ROOT']}/lib/assets/blockchain/block"
require "#{ENV['HASEEBCOIN_ROOT']}/lib/assets/blockchain/client"
require "#{ENV['HASEEBCOIN_ROOT']}/lib/assets/blockchain/helpers"

$prior_balance = 0.0
PORT, PEER_PORT = ARGV.first(2)
set :port, PORT

$PEERS = ThreadSafe::Array.new([PORT])
#$PEERS = Array.new([PORT])

PRIV_KEY, PUB_KEY = PKI.generate_key_pair
pk_hash = Digest::SHA256.hexdigest(PUB_KEY).to_i(16)
name = human_readable_name(PUB_KEY)
User.create(name: name, pk_hash: pk_hash, last_port: PORT, balance: 0.0)

if PEER_PORT.nil?
  # You are the progenitor!
  $BLOCKCHAIN = BlockChain.new(PUB_KEY, PRIV_KEY)
else
  # You're just joining the network.
  $PEERS << PEER_PORT
end

every(GOSSIP_TIMING) do
  $PEERS.dup.shuffle.each do |port|
    next if port == PORT

    puts "Gossiping about blockchain and peers with #{port.to_s.green}"
    gossip_with_peer(port)
  end
  render_state
end

# @param blockchain
# @param peers
post '/gossip' do
  their_blockchain = YAML.load(params['blockchain'], permitted_classes: YAML_PERMITTED_CLASSES )
  their_peers = YAML.load(params['peers'],  permitted_classes: YAML_PERMITTED_CLASSES )
  update_blockchain(their_blockchain)
  update_peers(their_peers)
  YAML.dump('peers' => $PEERS, 'blockchain' => $BLOCKCHAIN)
end

# @param to (port_number)
# @param amount
post '/send_money' do
  receiver_pub_key = Client.get_pub_key(params['to'])
  amount = params['amount'].to_i
  $BLOCKCHAIN.add_to_chain(Transaction.new(PUB_KEY, receiver_pub_key, amount, PRIV_KEY))
  'OK. Block mined!'
end

get '/pub_key' do
  PUB_KEY
end

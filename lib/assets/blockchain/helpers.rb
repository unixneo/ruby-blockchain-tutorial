# Original Code from: https://github.com/Haseeb-Qureshi/lets-build-a-blockchain/
require 'colorize'
Thread.abort_on_exception = true

def every(seconds)
  Thread.new do
    loop do
      sleep seconds
      yield
    end
  end
end



def human_readable_name(pub_key)
  pk_hash = Digest::SHA256.hexdigest(pub_key).to_i(16)
  HUMAN_READABLE_NAMES[pk_hash % HUMAN_READABLE_NAMES.length]
end

def readable_balances
  return "" if $BLOCKCHAIN.nil?
  $BLOCKCHAIN.compute_balances.map do |pub_key, balance|
    pk_hash = Digest::SHA256.hexdigest(pub_key).to_i(16)
    name = human_readable_name(pub_key) 
    if PUB_KEY == pub_key        
        begin
          if balance.to_f != $prior_balance
            $prior_balance = balance.to_f  
            User.where(name:name,pk_hash:pk_hash).update_all(balance:balance.to_f)
          end
        rescue => e
          puts "DB Exception #{e}".red
        end
    end
     "#{human_readable_name(pub_key).red} currently has #{balance.to_s.green}"
  end.join("\n")
end

def render_state
  system 'clear'
  puts Time.now.to_s.split[1].light_blue
  puts "My blockchain: " + $BLOCKCHAIN.to_s if DEBUG_BLOCKCHAIN
  puts "Blockchain length: " + ($BLOCKCHAIN || []).length.to_s if DEBUG_BLOCKCHAIN
  puts "PORT: #{PORT}"
  puts "My human-readable name: " + human_readable_name(PUB_KEY).red
  puts "My peers: " + $PEERS.sort.join(", ").to_s.yellow
  puts readable_balances
end

def gossip_with_peer(port)
  peers = YAML.dump($PEERS)
  blockchain = YAML.dump($BLOCKCHAIN)
  gossip_response = Client.gossip(port, peers, blockchain)
  parsed_response = YAML.load(gossip_response,  permitted_classes: YAML_PERMITTED_CLASSES)
  their_peers = parsed_response['peers']
  their_blockchain = parsed_response['blockchain']

  update_peers(their_peers)
  update_blockchain(their_blockchain)
rescue Faraday::ConnectionFailed => e
  $PEERS.delete(port)
end

def update_blockchain(their_blockchain)
  return if their_blockchain.nil?
  return if $BLOCKCHAIN && their_blockchain.length <= $BLOCKCHAIN.length
  return unless their_blockchain.valid?

  $BLOCKCHAIN = their_blockchain
end

def update_peers(their_peers)
  $PEERS = ($PEERS + their_peers).uniq
end

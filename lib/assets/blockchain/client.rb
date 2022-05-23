# Original Code from: https://github.com/Haseeb-Qureshi/lets-build-a-blockchain/

require 'faraday'

class Client
  URL = 'http://localhost'

  def self.gossip(port, peers, blockchain)
    
      Faraday.post("#{URL}:#{port}/gossip", peers: peers, blockchain: blockchain).body
  
  end

  def self.get_pub_key(port)
   
      Faraday.get("#{URL}:#{port}/pub_key").body
   
  end

  def self.send_money(port, to, amount)
   
      Faraday.post("#{URL}:#{port}/send_money", to: to, amount: amount).body
    
  end
end

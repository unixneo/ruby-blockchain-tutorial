# Original Code from: https://github.com/Haseeb-Qureshi/lets-build-a-blockchain/

require 'faraday'

class Client
  URL = 'http://localhost'

  def self.gossip(port, peers, blockchain)
    begin
      Faraday.post("#{URL}:#{port}/gossip", peers: peers, blockchain: blockchain).body
    rescue Faraday::ConnectionFailed => e
      puts "Client.gossip exception #{e}".red
      raise
    end
  end

  def self.get_pub_key(port)
    begin
      Faraday.get("#{URL}:#{port}/pub_key").body
    rescue Faraday::ConnectionFailed => e
      puts "Client.get_pub_key exception #{e}".red
      raise
    end
  end

  def self.send_money(port, to, amount)
    begin
      Faraday.post("#{URL}:#{port}/send_money", to: to, amount: amount).body
    rescue Faraday::ConnectionFailed => e
      puts "Client.send_money exception #{e}".red
      raise
    end
  end
end

require "#{ENV['HASEEBCOIN_ROOT']}/lib/assets/blockchain/client.rb"
require "colorize"
#r = Random.new


clients = [1111,2222,3333,4444,5555,6666]

pairs = []
clients.each do |id|
    tos = clients - [id]
    tos.each do |to|
        pairs << {
        :to => to,
        :from => id,
        }
    end
end

trap("SIGINT") { exit! }
while true
    pairs.shuffle.each do |pair|
        amounts = [rand(10..20),rand(121..130),rand(200..300),rand(333..400),rand(1401..1500),rand(2501..3000)]
        amounts.shuffle.each do |amount|
            puts "To: #{pair[:to]} From: #{pair[:from]} Amount #{amount}"
            begin
                Client.send_money(pair[:to],pair[:from],amount)
                sleep 2
            rescue Exception => e
                puts "Client.send_money exception #{e}".red
               
                next
            end
           
        end
    end
end


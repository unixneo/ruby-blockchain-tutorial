require_relative '../client.rb'

amounts = [1,2,3,4,5,6]
pairs = []

pairs << {
    :to => 1111,
    :from => 3333,
}

pairs << {
    :to => 2222,
    :from => 3333,
}

pairs << {
    :to => 2222,
    :from => 1111,
}


while true
    pairs.each do |pair|
        amounts.shuffle.each do |amount|
        puts "To: #{pair[:to]} From: #{pair[:from]} Amount #{amount}"
        Client.send_money(pair[:to],pair[:from],amount)
        sleep 2
    end
    end

    pairs << {
        :to => 2222,
        :from => 3333,
    }

    pairs << {
        :to => 3333,
        :from => 1111,
    }


    pairs.each do |pair|
        puts "To: #{pair[:to]} From: #{pair[:from]} Amount #{amount}"
        amounts.shuffle.each do |amount|
        Client.send_money(pair[:to],pair[:from],amount)
        sleep 2
    end
    end

end


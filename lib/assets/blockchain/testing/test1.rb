require_relative '../client.rb'
amounts = [1,2,3,4,5,6]

pairs = []

pairs << {
    :to => 1111,
    :from => 2222,
}

pairs << {
    :to => 2222,
    :from => 3333,
}

pairs << {
    :to => 3333,
    :from => 1111,
}

pairs << {
    :to => 3333,
    :from => 2222,
}

pairs << {
    :to => 1111,
    :from => 2222,
}

pairs << {
    :to => 4444,
    :from => 3333,
}

pairs << {
    :to => 1111,
    :from => 4444,
}

pairs << {
    :to => 3333,
    :from => 4444,
}


while true
    pairs.shuffle.each do |pair|
        amounts.shuffle.each do |amount|
            puts "To: #{pair[:to]} From: #{pair[:from]} Amount #{amount}"
            Client.send_money(pair[:to],pair[:from],amount)
            sleep 2
        end
    end
end


class BlackJack
	@@card_tracker = Array.new(52) {false}
	@@suit = ["Hearts", "Spades", "Diamonds", "Clubs"]
	@@card = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace"]
	@@name = nil
	@@player_hand = 0
	@@dealer_hand = 0
	


	def main
		puts "WELCOME TO BLACKJACK!"
		puts "What is your name?"

		@@name = gets.chomp	
		puts "Thank you #{@@name} let's get started!"
	    @@player_hand += deal_card(@@name)
	    puts "#{@@name} has #{@@player_hand}" 
	    @@dealer_hand += deal_card("Dealer")
	    puts "Dealer has #{@@dealer_hand}"
		@@player_hand += deal_card(@@name) 
		puts "#{@@name} has #{@@player_hand}"
		@@dealer_hand += deal_card("Dealer") 
		puts "Dealer has #{@@dealer_hand}"
		if @@player_hand == 21
		  	puts "#{@@name} has Blackjack! #{@@name} Wins!" 
			return
		else 
			hit_stay
		end
		if @@player_hand == 21 || @@player_hand > 21
			return
		end
		if @@dealer_hand == 21
			puts "Dealer has 21, dealer wins"
		else
			turn_dealer
		end
		


	end

	def deal_card(player_name)
		random = rand(0..51)
		while @@card_tracker[random] == true
			random = rand(0..51)
		end
		@@card_tracker[random] = true
		suit_id = random / 14
		suit_dealt = @@suit[suit_id]
		card_id = random % 14
		card_dealt = @@card[card_id]
		puts "#{player_name} was dealt the #{card_dealt} of #{suit_dealt}."
		if (1..10).member?(card_id + 1) 
			return card_id + 1
		elsif (11..13).member?(card_id +1)
			return 10
		else
			return 11 
		end

	end
	def hit_stay
		while @@player_hand < 21
			puts "Would you like to 'hit' or 'stay'?"
			response = gets.chomp
			if response == "hit"
				 @@player_hand += deal_card(@@name)
				 puts "#{@@name} has #{@@player_hand}" 
			elsif response == "stay"
				puts "#{@@name} chose to stay."
				break
			end
			
			if @@player_hand == 21
				puts "#{@@name} has BlackJack! #{@@name} Wins!"
			elsif @@player_hand > 21
				puts "Busted! Dealer Wins!"
			end
		end
	end
	def turn_dealer
		while @@dealer_hand < 17
			puts "Dealer hits"
			@@dealer_hand += deal_card("Dealer")
			puts "Dealer has #{@@dealer_hand}"
			if @@dealer_hand > 21
				puts "Dealer Busted! #{@@name} Wins!"
				break
			elsif @@dealer_hand >= 17
				puts "Dealer stays"
				break
			elsif @@dealer_hand == 21
				puts "Dealer has BlackJack! Dealer Wins!"
			end
		end
	end		
end
game = BlackJack.new
game.main



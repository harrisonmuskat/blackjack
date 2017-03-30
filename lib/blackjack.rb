require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "player"
require_relative "dealer"
require 'colorize'
require 'pry'

play = true
player_names = ["Darth Vader", "Darth Maul", "Obi Wan", "Luke", "Yoda", "Mace Windu"]

while play do
  print "Play a game? (Y/N)"
  answer = gets.chomp
  answer.downcase == "n" ? break : play

  print "What's your name?"
  players = Array.new << Player.new(gets.chomp)

  print "How many players are there? (1-6)"
  player_count = gets.chomp.to_i

  player_names.shuffle!
  if player_count > 1
    player_count -= 1
    player_count.times do |i|
      players << Player.new(player_names[i])
    end
  end
  dealer = Dealer.new(player_names[player_count+1])

  players.each do |player|
    cards_dealt_to_current_player = dealer.deck.deal(2)
    cards_dealt_to_current_player.each do |card|
      player.hand.add_card(card)
      puts "#{player.name} was dealt #{card.card_printer}"
      sleep 0.5
    end
  end

  cards_dealt_to_dealer = dealer.deck.deal(2)
  cards_dealt_to_dealer.each_with_index do |card, index|
    dealer.hand.add_card(card)
    puts index == 0 ?
      "#{dealer.name} (dealer) was dealt #{card.card_printer}".colorize(:yellow) :
      "Dealer took a second card.".colorize(:yellow)
    sleep 0.5
  end

  winner = false
  players.each do |player|
    player.player_results
    action = ""
    until action.downcase == "s" || player.hand.calculate_hand >= 21 do
      print "#{player.name} - Hit or stand? (H/S)"
      action = gets.chomp
      while action.downcase != "h" && action.downcase != "s"
        print "#{player.name} - please input H or S."
        action = gets.chomp
      end
      if action.downcase == "h"
        card = dealer.deck.deal(1).first
        player.hand.add_card(card)
        puts "#{player.name} was dealt #{card.card_printer}"
        sleep 0.5
        player.player_results
      end
      if player.hand.calculate_hand > 21
        player.bust = true
      elsif player.hand.calculate_hand == 21
        player.win = true
      end
    end
    if player.win == true
      puts "#{player.name} gets 21!"
      winner = true
    end
    puts "#{player.name} busts!" if player.bust == true
  end

  until dealer.hand.calculate_hand >= 17 do
    card = dealer.deck.deal(1).first
    dealer.hand.add_card(card)
    puts "#{dealer.name} was dealt #{card.card_printer}".colorize(:yellow)
    dealer.dealer_results
    sleep 0.5
  end

  if dealer.hand.calculate_hand > 21
    dealer.bust = true
  elsif dealer.hand.calculate_hand == 21
    dealer.win = true
  end
  puts "#{dealer.name} (dealer) gets 21!".colorize(:yellow) if dealer.win == true
  puts "#{dealer.name} busts! Players win!".colorize(:yellow) if dealer.bust == true

  if !winner && !dealer.win && !dealer.bust
    highest_scoring_player = players.max {|player1, player2| player1.hand.calculate_hand <=> player2.hand.calculate_hand}
    highest_scoring_player_hand = highest_scoring_player.hand.calculate_hand
    dealer_score = dealer.hand.calculate_hand
    if  highest_scoring_player_hand < dealer_score
      puts "#{dealer.name} (dealer) wins with a score of #{dealer_score} over #{highest_scoring_player.name}'s score of #{highest_scoring_player_hand}"
    elsif
      players.each do |player|
        if player.hand.calculate_hand > dealer_score
          puts "#{player.name} defeats the dealer, #{dealer.name}"
        end
      end
    else
      puts "There was a tie."
    end
  end
end

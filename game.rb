class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players[0]
  end

  def start
    until game_over?
      math_question = MathQuestion.new
      puts "#{@current_player.name}"
      puts math_question.generate_question

      answer = gets.chomp

      if math_question.check_answer(answer)
        puts "Correct!"
      else
        puts "Incorrect!"
        @current_player.lose_life
      end

      print_score
      switch_player
    end

    announce_winner
  end

  private

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def game_over?
    @players.any? { |player| player.lives == 0 }
  end

  def print_score
    puts "Score: #{@players[0].name}: #{@players[0].lives}"
    puts "       #{@players[1].name}: #{@players[1].lives}"
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    loser = @players.find { |player| player.lives == 0 }
    puts "#{winner.name} wins with a score of #{winner.lives}/#{loser.lives + 1}."
  end
end

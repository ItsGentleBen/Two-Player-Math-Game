class Game
  
  def initialize
    puts "Welcome one and all! Join the fun of math and madness!"
    puts "Player 1, please enter your name!"
    @player1 = Player.new($stdin.gets.chomp)
    puts "#{@player1.name}, now that is a fine name!"
    puts "Player 2, please enter your name!"
    @player2 = Player.new($stdin.gets.chomp)
    puts "#{@player2.name}! Marvellous! Thank you for your cooperation!"
    puts "And now! On with the game!"
    @current_player = @player1 
    self.question_round
  end

  def question_round
    @question_set = Questions.new
    puts "--#{@player1.name}'s lives #{@player1.lives}/3--#{@player2.name}'s lives #{@player2.lives}/3--"
    puts "Alright #{@current_player.name}, can you tell me what #{@question_set.first_num} + #{@question_set.second_num} equals?"
    @player_answer = $stdin.gets.chomp
    self.check_answer
    self.game_over
  end

  def check_answer
    if (@player_answer.to_i === @question_set.answer.to_i) 
      puts "That is correct! Good job, buckaroo!"
    else
      puts "I'm afraid that is incorrect. Lose one life!"
      @current_player.remove_life
    end
    @current_player = @current_player === @player1 ? @player2 : @player1 
  end

  def game_over
    if (@player1.lives === 0)
      puts "Congratulation #{@player2.name}, you are the winner! Good job at math!"
    elsif (@player2.lives === 0)
      puts "Congratulation #{@player1.name}, you are the winner! Good job at math!"
    else 
      puts "--NEW TURN--"
      self.question_round
    end
  end
  
end
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if @game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "Here is the sequence"
    sleep(3)
    @seq.each do |color|
      puts color
      sleep(2)
      system("clear")
      sleep(1)
    end
    system("clear")
  end

  def require_sequence
    puts "Please enter the sequence starting with the first"

    @seq.each do |color|
      guess = gets.chomp
      @game_over = true if guess != color
    end
  end

  def add_random_color
    seq << COLORS.shuffle.last
  end

  def round_success_message
    puts "You passed the round!"
  end

  def game_over_message
    puts "Wrong sequence! Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end

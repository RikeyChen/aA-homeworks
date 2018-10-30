class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    cups.each_index do |i|
      4.times do
        cups[i] << :stone unless i == 6 || i == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 13)
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    held_stones = []
    (0...cups[start_pos].length).each do
      picked_stone = cups[start_pos].pop
      held_stones << picked_stone
    end

    idx = start_pos
    until held_stones.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[6] << held_stones.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << held_stones.pop if current_player_name == @name2
      else
        @cups[idx] << held_stones.pop
      end
    end

    render
    next_turn(idx)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].size == 1
      :switch
    elsif !@cups[ending_cup_idx].empty?
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6].size <=> @cups[13].size
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end

class Board
  attr_accessor :cups
  PLAYER_BANKS = [6, 13]
  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones

    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      4.times { cup << :stone } unless PLAYER_BANKS.include?(index)
    end
  end

  def valid_move?(start_pos)
    if PLAYER_BANKS.include?(start_pos) || !(1..13).include?(start_pos)
      raise ArgumentError.new "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    pieces = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    case current_player_name
    when @player1
      until pieces.empty?
        i += 1
        next if i == 13
        i = 0 if i == 14
        @cups[i] << :stone
        pieces.pop
      end
    when @player2
      until pieces.empty?
        i += 1
        next if i == 6
        i = 0 if i == 14
        @cups[i] << :stone
        pieces.pop
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
    # return @cups[ending_cup_idx]
    # return ending_cup_idx if @cups[ending_cup_idx].include?(:stone)
    # helper method to determine what #make_move returns
    return :prompt if PLAYER_BANKS.include?(ending_cup_idx)
    return :switch if @cups[ending_cup_idx].length == 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).all? {|n| @cups[n].empty?} || (7..12).all? {|n| @cups[n].empty?}
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @player1 : @player2
  end
end

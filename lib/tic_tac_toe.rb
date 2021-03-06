class TicTacToe

  def initialize(board = Array.new(9," "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move (user_input, token = "X")
    @board[user_input.to_i - 1] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index].nil?)
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    current_player = turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_index|
      position_taken?(win_index[0]) &&
      @board[win_index[0]] == @board[win_index[1]] &&
      @board[win_index[1]] == @board[win_index[2]]
    end
  end

  def full?
    @board.all? { |position| position == "X" || position == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end

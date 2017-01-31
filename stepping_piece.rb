module SteppingPiece

  def moves
    case move_dir
    when :king
      king_moves
    when :knight
      knight_moves
    end
  end

  def king_moves
    current_row, current_col = @current_position
    unobstructed_moves = []

    (-1..1).each do |delta_x|
      (-1..1).each do |delta_y|
        next if delta_x == 0 && delta_y == 0
        row, col = current_row + delta_x, current_col + delta_y
        piece = @board[[row, col]]
        unobstructed_moves << [row, col] unless piece.team == @team || piece.nil?
      end
    end

    unobstructed_moves
  end

  def knight_moves
    deltas = [[-2 , -1],[-1, -2],[-2 ,1],[1, -2],[2,-1],[-1, 2],[2, 1],[1, 2]]
    current_row, current_col = @current_position
    unobstructed_moves = deltas.map do |delta|
      [current_row + delta[0] , current_col + delta[1]]
    end

    unobstructed_moves.reject { |pos| @board[pos].team == @team || @board[pos].nil?}
  end


end

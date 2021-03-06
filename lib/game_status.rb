# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

# def won?(board)
#   WIN_COMBINATIONS.each do |winning_combo|
#     win_index_1 = winning_combo[0]
#     win_index_2 = winning_combo[1]
#     win_index_3 = winning_combo[2]
#
#     position_1 = board[win_index_1]
#     position_2 = board[win_index_2]
#     position_3 = board[win_index_3]
#
#
#     if ( position_1 == "X" && position_2 == "X" && position_3 == "X" ) || ( position_1 == "O" && position_2 == "O" && position_3 == "O" )
#       return [win_index_1, win_index_2, win_index_3]
#     end
#   end
#
#   return false
# end

def won?(board)
  WIN_COMBINATIONS.detect do | combo |
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0]) 
  end
end

def full?(board)
  board.none? { | position | position == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    winning_player = board[win_combo[0]]
    return winning_player
  elsif draw?(board)
    return nil
  end
end

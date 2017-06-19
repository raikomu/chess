class Pawn
  attr_accessor :pos, :passable, :has_moved
  
  def initialize(coords)
    @pos = coords
    @passable = false
    @has_moved = false
  end
end

class WPawn < Pawn
  attr_reader :sym, :color, :poss_moves

  def initialize(coords)
    super
    @sym = "\u2659"
    @color = :white
  end

  def gen_moves(board)
    @poss_moves = []
    @poss_moves << [0,2] if @has_moved == false
    @poss_moves << [0,1] if within_board?([@pos[0], @pos[1] + 1]) && find_piece([@pos[0],@pos[1] + 1], board).nil?
    @poss_moves << [-1,1] if within_board?([@pos[0] - 1, @pos[1] + 1]) && !find_piece([@pos[0] - 1, @pos[1] + 1], board).nil? && find_piece([@pos[0] - 1, @pos[1] + 1], board).color != @color
    @poss_moves << [-1,1] if within_board?([@pos[0] - 1, @pos[1] + 1]) && !find_piece([@pos[0] - 1, @pos[1]], board).nil? && find_piece([@pos[0] - 1, @pos[1]], board).passable == true
    @poss_moves << [1,1] if within_board?([@pos[0] + 1, @pos[1] + 1]) && !find_piece([@pos[0] + 1, @pos[1] + 1], board).nil? && find_piece([@pos[0] + 1, @pos[1] + 1], board).color != @color
    @poss_moves << [1,1] if within_board?([@pos[0] + 1, @pos[1] + 1]) && !find_piece([@pos[0] + 1, @pos[1]], board).nil? && find_piece([@pos[0] + 1, @pos[1]], board).passable == true
  end
end

class BPawn < Pawn
  attr_reader :sym, :color, :poss_moves

  def initialize(coords)
    super
    @sym = "\u265F"
    @color = :black
  end

  def gen_moves(board)
    @poss_moves = []
    @poss_moves << [0,-2] if @has_moved == false
    @poss_moves << [0,-1] if within_board?([@pos[0], @pos[1] - 1]) && find_piece([@pos[0],@pos[1] - 1], board).nil?
    @poss_moves << [-1,-1] if within_board?([@pos[0] - 1, @pos[1] - 1]) && !find_piece([@pos[0] - 1, @pos[1] - 1], board).nil? && find_piece([@pos[0] - 1, @pos[1] - 1], board).color != @color
    @poss_moves << [-1,-1] if within_board?([@pos[0] - 1, @pos[1] - 1]) && !find_piece([@pos[0] - 1, @pos[1]], board).nil? && find_piece([@pos[0] - 1, @pos[1]], board).passable == true    
    @poss_moves << [1,-1] if within_board?([@pos[0] + 1, @pos[1] - 1]) && !find_piece([@pos[0] + 1, @pos[1] - 1], board).nil? && find_piece([@pos[0] + 1, @pos[1] - 1], board).color != @color
    @poss_moves << [1,-1] if within_board?([@pos[0] + 1, @pos[1] - 1]) && !find_piece([@pos[0] + 1, @pos[1]], board).nil? && find_piece([@pos[0] + 1, @pos[1]], board).passable == true
  end  
end

def find_piece(coords, board)
  board.find { |sq| sq.coords == coords }.piece
end

def within_board?(coords)
  coords.all? { |i| i.between?(0,7) }
end
abstract class TicTacToeEvent {}

class TileTapped extends TicTacToeEvent {
  final int index;
  TileTapped(this.index);
}

class GameReset extends TicTacToeEvent {}

// Event to trigger loading the score
class LoadScore extends TicTacToeEvent {}
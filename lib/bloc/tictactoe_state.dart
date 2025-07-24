class TicTacToeState {
  final List<String> board;
  final bool isXTurn;
  final String? winner;
  final bool isDraw;
  final int scoreX;
  final int scoreO;

  TicTacToeState({
    this.board = const ['','','','','','','','',''],
    this.isXTurn = true,
    this.winner,
    this.isDraw = false,
    this.scoreX = 0,
    this.scoreO = 0,
  });

  TicTacToeState copyWith({
    List<String>? board,
    bool? isXTurn,
    String? winner,
    bool? isDraw,
    int? scoreX,
    int? scoreO,
    bool clearWinner = false,
  }) {
    return TicTacToeState(
      board: board ?? this.board,
      isXTurn: isXTurn ?? this.isXTurn,
      winner: clearWinner ? null : winner ?? this.winner,
      isDraw: isDraw ?? this.isDraw,
      scoreX: scoreX ?? this.scoreX,
      scoreO: scoreO ?? this.scoreO,
    );
  }
}
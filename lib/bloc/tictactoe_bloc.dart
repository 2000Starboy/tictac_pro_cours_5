import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tictactoe_event.dart';
import 'tictactoe_state.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  TicTacToeBloc() : super(TicTacToeState()) {
    on<LoadScore>(_onLoadScore);
    on<TileTapped>(_onTileTapped);
    on<GameReset>(_onGameReset);
    add(LoadScore());
  }

  Future<void> _onLoadScore(LoadScore event, Emitter<TicTacToeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final scoreX = prefs.getInt('scoreX') ?? 0;
    final scoreO = prefs.getInt('scoreO') ?? 0;
    emit(state.copyWith(scoreX: scoreX, scoreO: scoreO));
  }

  Future<void> _saveScore(int scoreX, int scoreO) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('scoreX', scoreX);
    await prefs.setInt('scoreO', scoreO);
  }

  void _onTileTapped(TileTapped event, Emitter<TicTacToeState> emit) {
    if (state.board[event.index] == '' && state.winner == null) {
      final newBoard = List<String>.from(state.board);
      newBoard[event.index] = state.isXTurn ? 'X' : 'O';
      final newWinner = _checkWinner(newBoard);
      int newScoreX = state.scoreX;
      int newScoreO = state.scoreO;
      if (newWinner != null) {
        if (newWinner == 'X') newScoreX++; else newScoreO++;
        _saveScore(newScoreX, newScoreO);
      }
      final isDraw = newWinner == null && !newBoard.contains('');
      emit(state.copyWith(
        board: newBoard,
        isXTurn: !state.isXTurn,
        winner: newWinner,
        isDraw: isDraw,
        scoreX: newScoreX,
        scoreO: newScoreO,
      ));
    }
  }

  void _onGameReset(GameReset event, Emitter<TicTacToeState> emit) {
    emit(state.copyWith(
      board: List.filled(9, ''),
      isXTurn: true,
      isDraw: false,
      clearWinner: true,
    ));
  }

  String? _checkWinner(List<String> board) {
    const lines = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    for (var line in lines) {
      String player = board[line[0]];
      if (player != '' && player == board[line[1]] && player == board[line[2]]) {
        return player;
      }
    }
    return null;
  }
}
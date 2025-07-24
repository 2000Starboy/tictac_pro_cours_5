import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tictactoe_bloc.dart';
import '../bloc/tictactoe_event.dart';
import '../bloc/tictactoe_state.dart';

class TicTacToeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String playerName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Partie de $playerName'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => context.read<TicTacToeBloc>().add(GameReset()),
            tooltip: 'Réinitialiser',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: TicTacToeGame()),
      ),
    );
  }
}

class TicTacToeGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicTacToeBloc, TicTacToeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScoreBoard(context, state),
              const SizedBox(height: 30),
              _buildGameBoard(context, state),
              const SizedBox(height: 30),
              _buildStatus(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScoreBoard(BuildContext context, TicTacToeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text('Joueur X', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(state.scoreX.toString(),
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        Container(
          height: 50,
          width: 2,
          color: Colors.grey.shade700,
        ),
        Column(
          children: [
            Text('Joueur O', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(state.scoreO.toString(),
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ],
    );
  }

  Widget _buildGameBoard(BuildContext context, TicTacToeState state) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.read<TicTacToeBloc>().add(TileTapped(index)),
          child: Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                state.board[index],
                style: TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.bold,
                  color: state.board[index] == 'X'
                      ? Colors.redAccent
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatus(BuildContext context, TicTacToeState state) {
    String statusText;
    if (state.winner != null) {
      statusText = 'Le gagnant est: ${state.winner}!';
    } else if (state.isDraw) {
      statusText = 'Égalité!';
    } else {
      statusText = 'Au tour de: ${state.isXTurn ? "X" : "O"}';
    }
    return Text(
      statusText,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }
}

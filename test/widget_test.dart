import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nav_data/bloc/tictactoe_bloc.dart';
import 'package:flutter_nav_data/main.dart';

void main() {
  testWidgets('Login screen builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => TicTacToeBloc(),
        child: MyApp(),
      ),
    );

    expect(find.text('Jouer'), findsOneWidget);
  });
}

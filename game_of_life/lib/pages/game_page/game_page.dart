import 'package:flutter/material.dart';
import 'package:game_of_life/pages/game_page/widgets/game_ttimer_buttons.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider/game_provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  static const String routeName = '/game';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Life'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          children: [
            gameProvider.displayGrid(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StopButton(
            onPressed: () {
              gameProvider.stop();
              Navigator.pop(
                context,
              );
            },
          ),
          StartButton(
            onPressed: gameProvider.start,
          ),
          PauseButton(
            onPressed: gameProvider.pause,
          ),
        ],
      ),
    );
  }
}

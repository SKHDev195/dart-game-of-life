import 'package:flutter/material.dart';
import 'package:game_of_life/pages/game_page/widgets/game_timer_buttons.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider/game_provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
  });
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
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gameProvider.displayGrid(context),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StopButton(
                onPressed: () {
                  gameProvider.stop();
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ),
            Expanded(
              child: StartButton(
                onPressed: gameProvider.start,
              ),
            ),
            Expanded(
              child: PauseButton(
                onPressed: gameProvider.pause,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

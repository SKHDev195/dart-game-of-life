import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/pages/game_page/widgets/game_timer_buttons.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider/game_provider.dart';
import '../../providers/timer_context_provider/timer_context_provider.dart';

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
    final timerContextProvider = context.read<TimerContextProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Life'),
        automaticallyImplyLeading: false,
      ),
      body: StateNotifierBuilder(
        stateNotifier: timerContextProvider,
        builder: (context, value, child) {
          return Center(
            child: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: gameProvider.displayGrid(context),
                  ),
                ],
              ),
            ),
          );
        },
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
                  timerContextProvider.stop();
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ),
            Expanded(
              child: StartButton(
                onPressed: () {
                  gameProvider.start();
                  timerContextProvider.start();
                },
              ),
            ),
            Expanded(
              child: PauseButton(
                onPressed: () {
                  gameProvider.pause();
                  timerContextProvider.pause();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

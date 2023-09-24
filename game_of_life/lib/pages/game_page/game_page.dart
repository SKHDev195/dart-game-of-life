import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/pages/game_page/utils/stop_dialog_renderer.dart';
import 'package:game_of_life/pages/game_page/widgets/game_timer_buttons.dart';

import 'package:game_of_life/utils/error_dialog_renderer.dart';
import 'package:game_of_life/utils/flushbar_renderer.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider/game_provider.dart';
import '../../providers/timer_context_provider/timer_context_provider.dart';
import '../../services/theme_service.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/theme_switchers.dart';
import '../setup_page/setup_page.dart';

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
    GameState gameState = context.watch<GameState>();

    if (gameState.gameStatus == GameStatus.setup) {
      return const LoadingWidget();
    } else if (gameState.gameStatus == GameStatus.error) {
      ErrorDialogRenderer.errorDialog(
        context,
        gameState.customError,
      );
      return const LoadingWidget();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Life'),
        automaticallyImplyLeading: false,
        actions: const [
          DarkThemeButton(),
          LightThemeButton(),
        ],
      ),
      body: StateNotifierBuilder(
        stateNotifier: timerContextProvider,
        builder: (
          context,
          _,
          __,
        ) {
          return Center(
            child: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (context.watch<ThemeService>().isDark)
                            ? const Color.fromARGB(
                                255,
                                84,
                                84,
                                84,
                              )
                            : Colors.black,
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignCenter,
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
                  FlushbarRenderer.showOnHoldFlushbar(context);
                  StopDialogRenderer.stopDialog(context, () {
                    Navigator.pop(
                      context,
                    );
                    Navigator.pushNamed(
                      context,
                      SetupPage.routeName,
                    );
                    timerContextProvider.stop();
                  });
                },
              ),
            ),
            Expanded(
              child: StartButton(
                onPressed: () {
                  FlushbarRenderer.showGoingFlushbar(context);
                  timerContextProvider.start();
                },
              ),
            ),
            Expanded(
              child: PauseButton(
                onPressed: () {
                  FlushbarRenderer.showPausedFlushbar(context);
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

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/providers/theme_provider/theme_provider.dart';
import 'package:game_of_life/providers/timer_context_provider/timer_context_provider.dart';
import 'package:game_of_life/repositories/theme_repository.dart';
import 'providers/game_provider/game_provider.dart';
import 'repositories/game_repository.dart';
import 'pages/game_page/game_page.dart';
import 'pages/setup_page/setup_page.dart';
import 'providers/setup/setup_provider.dart';
import 'repositories/grid_renderer_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const GameOfLife(),
  );
}

class GameOfLife extends StatelessWidget {
  const GameOfLife({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeRepository>(
          create: (_) => ThemeRepository(),
        ),
        Provider<GridRendererRepository>(
          create: (_) => GridRendererRepository(),
        ),
        Provider<GameRepository>(
          create: (_) => GameRepository(),
        ),
        StateNotifierProvider<SetupProvider, SetupState>(
          create: (context) => SetupProvider(),
        ),
        StateNotifierProvider<TimerContextProvider, TimerContextState>(
          create: (context) => TimerContextProvider(),
        ),
        StateNotifierProvider<GameProvider, GameState>(
          create: (context) => GameProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Game of Life',
        debugShowCheckedModeBanner: false,
        theme: context.watch<ThemeRepository>().appTheme,
        home: const SetupPage(),
        routes: {
          SetupPage.routeName: (context) => const SetupPage(),
          GamePage.routeName: (context) => const GamePage(),
        },
      ),
    );
  }
}

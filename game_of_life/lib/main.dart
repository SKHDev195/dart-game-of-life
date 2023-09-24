import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/providers/theme_provider/theme_provider.dart';
import 'package:game_of_life/providers/timer_context_provider/timer_context_provider.dart';
import 'package:game_of_life/repositories/theme_repository.dart';
import 'package:game_of_life/services/theme_service.dart';
import 'package:game_of_life/utils/app_theme.dart';
import 'providers/game_provider/game_provider.dart';
import 'repositories/game_repository.dart';
import 'pages/game_page/game_page.dart';
import 'pages/setup_page/setup_page.dart';
import 'providers/setup/setup_provider.dart';
import 'repositories/grid_renderer_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: const GameOfLife(),
    ),
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
        Provider<GridRendererRepository>(
          create: (_) => GridRendererRepository(),
        ),
        Provider<GameRepository>(
          create: (_) => GameRepository(),
        ),
        StateNotifierProvider<SetupProvider, SetupState>(
          create: (_) => SetupProvider(),
        ),
        StateNotifierProvider<TimerContextProvider, TimerContextState>(
          create: (_) => TimerContextProvider(),
        ),
        StateNotifierProvider<GameProvider, GameState>(
          create: (_) => GameProvider(),
        ),
      ],
      child: Consumer<ThemeService>(
        builder: (context, themeService, _) {
          return MaterialApp(
            title: 'Game of Life',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeService.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const SetupPage(),
            routes: {
              SetupPage.routeName: (context) => const SetupPage(),
              GamePage.routeName: (context) => const GamePage(),
            },
          );
        },
      ),
    );
  }
}

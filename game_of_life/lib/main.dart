import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
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
        Provider<GridRendererRepository>(
          create: (_) => GridRendererRepository(),
        ),
        StateNotifierProvider<SetupProvider, SetupState>(
          create: (context) => SetupProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Game of Life',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
          ),
        ),
        home: const SetupPage(),
        routes: {
          SetupPage.routeName: (context) => const SetupPage(),
        },
      ),
    );
  }
}

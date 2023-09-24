import 'package:flutter/material.dart';
import 'package:game_of_life/providers/theme_provider/theme_provider.dart';
import 'package:game_of_life/services/theme_service.dart';
import 'package:provider/provider.dart';

final class DarkThemeButton extends StatelessWidget {
  const DarkThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ThemeService>().toggleDark(),
      icon: const Icon(
        Icons.dark_mode_outlined,
      ),
    );
  }
}

final class LightThemeButton extends StatelessWidget {
  const LightThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ThemeService>().toggleLight(),
      icon: const Icon(
        Icons.light_mode_outlined,
      ),
    );
  }
}

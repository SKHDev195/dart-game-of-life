import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '../../models/custom_error.dart';
import '../../repositories/theme_repository.dart';
import '../../utils/app_theme.dart';

part 'theme_state.dart';

final class ThemeProvider extends StateNotifier<ThemeState> with LocatorMixin {
  ThemeProvider()
      : super(
          ThemeState.initial(),
        );

  void switchTheme() {
    final themeRepository = read<ThemeRepository>();
    bool isDark = themeRepository.appTheme == AppTheme.darkTheme;
    ThemeStatus newThemeStatus = (state.themeStatus == ThemeStatus.dark)
        ? ThemeStatus.light
        : ThemeStatus.dark;
    themeRepository.setTheme(
      appTheme: isDark ? AppTheme.lightTheme : AppTheme.darkTheme,
    );
    state = state.copyWith(
      themeStatus: newThemeStatus,
    );
  }
}

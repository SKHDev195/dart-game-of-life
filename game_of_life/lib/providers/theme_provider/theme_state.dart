part of 'theme_provider.dart';

enum ThemeStatus {
  light,
  dark,
}

final class ThemeState extends Equatable {
  const ThemeState({
    required this.themeStatus,
    required this.customError,
  });

  final ThemeStatus themeStatus;
  final CustomError customError;

  factory ThemeState.initial() {
    return const ThemeState(
      themeStatus: ThemeStatus.dark,
      customError: CustomError(),
    );
  }

  @override
  List<Object?> get props => [
        themeStatus,
        customError,
      ];

  ThemeState copyWith({
    ThemeStatus? themeStatus,
    CustomError? customError,
  }) {
    return ThemeState(
      themeStatus: themeStatus ?? this.themeStatus,
      customError: customError ?? this.customError,
    );
  }

  @override
  bool get stringify => true;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'game_provider.dart';

enum GameStatus {
  setup,
  loaded,
  error,
}

final class GameState extends Equatable {
  const GameState({
    required this.gameStatus,
    required this.customError,
  });

  final GameStatus gameStatus;

  final CustomError customError;

  factory GameState.initial() {
    return const GameState(
      gameStatus: GameStatus.setup,
      customError: CustomError(),
    );
  }

  @override
  List<Object> get props => [
        gameStatus,
        customError,
      ];

  @override
  bool get stringify => true;

  GameState copyWith({
    GameStatus? gameStatus,
    CustomError? customError,
  }) {
    return GameState(
      gameStatus: gameStatus ?? this.gameStatus,
      customError: customError ?? this.customError,
    );
  }
}

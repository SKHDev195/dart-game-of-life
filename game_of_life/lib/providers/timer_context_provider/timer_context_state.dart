part of 'timer_context_provider.dart';

enum TimerContextStatus {
  paused,
  stopped,
  error,
  ticking,
}

final class TimerContextState extends Equatable {
  const TimerContextState({
    required this.timerContextStatus,
    required this.customError,
  });

  final TimerContextStatus timerContextStatus;
  final CustomError customError;

  factory TimerContextState.initial() {
    return const TimerContextState(
      timerContextStatus: TimerContextStatus.paused,
      customError: CustomError(),
    );
  }

  @override
  List<Object> get props => [
        timerContextStatus,
        customError,
      ];

  @override
  bool get stringify => true;

  TimerContextState copyWith({
    TimerContextStatus? timerContextStatus,
    CustomError? customError,
  }) {
    return TimerContextState(
      timerContextStatus: timerContextStatus ?? this.timerContextStatus,
      customError: customError ?? this.customError,
    );
  }
}

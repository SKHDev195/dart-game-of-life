// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'setup_provider.dart';

enum SetupStatus {
  initial,
  submitting,
  success,
  error,
}

final class SetupState extends Equatable {
  const SetupState({
    required this.setupStatus,
    required this.customError,
  });
  final SetupStatus setupStatus;
  final CustomError customError;

  factory SetupState.initial() {
    return const SetupState(
      setupStatus: SetupStatus.initial,
      customError: CustomError(),
    );
  }

  @override
  List<Object> get props => [
        setupStatus,
        customError,
      ];

  SetupState copyWith({
    SetupStatus? setupStatus,
    CustomError? customError,
  }) {
    return SetupState(
      setupStatus: setupStatus ?? this.setupStatus,
      customError: customError ?? this.customError,
    );
  }

  @override
  bool get stringify => true;
}

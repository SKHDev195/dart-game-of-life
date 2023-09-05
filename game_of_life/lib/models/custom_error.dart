import 'package:equatable/equatable.dart';

final class CustomError extends Equatable {
  const CustomError({
    this.message = '',
  });

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool get stringify => true;
}

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, this.code});

  final String message;

  final Object? code;

  @override
  List<Object?> get props => [message, code];
}

import 'package:equatable/equatable.dart';

import 'failures.dart';

abstract class BaseEvent extends Equatable {}

abstract class BaseState extends Equatable {}

class InitialState extends BaseState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends BaseState {
  final Failure failure;

  ErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}

class LoadingState extends BaseState {
  @override
  List<Object?> get props => [];
}
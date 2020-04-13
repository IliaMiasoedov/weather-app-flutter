import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/src/error/failures.dart';

// (WState - means Widget State)
abstract class WState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends WState {}

class Loading extends WState {}

class Loaded<T> extends WState {
  final T data;

  Loaded({@required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends WState {
  final Failure failure;

  Error({this.failure});

  @override
  List<Object> get props => [failure];
}

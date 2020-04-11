import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/src/features/data/model/WeatherResponse.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final WeatherResponse data;

  Loaded({@required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends HomeState {
  final String message;

  Error({this.message});

  @override
  List<Object> get props => [message];
}

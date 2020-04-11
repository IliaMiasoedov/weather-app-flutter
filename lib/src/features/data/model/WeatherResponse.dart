import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/src/features/data/model/Current.dart';
import 'package:weatherapp/src/features/data/model/Request.dart';
import 'package:weatherapp/src/features/data/model/Location.dart';

part 'WeatherResponse.g.dart';

@JsonSerializable(nullable: false)
class WeatherResponse {
  final Request request;
  final Location location;
  final Current current;

  WeatherResponse({this.request, this.location, this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

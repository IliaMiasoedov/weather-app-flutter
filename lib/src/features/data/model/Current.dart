import 'package:json_annotation/json_annotation.dart';

part 'Current.g.dart';

@JsonSerializable(nullable: false)
class Current {
  @JsonKey(name: 'observation_time')
  final String observationTime;
  final int temperature;
  @JsonKey(name: 'weather_icons')
  final List<String> weatherIcons;
  @JsonKey(name: 'weather_descriptions')
  final List<String> weatherDescriptions;
  @JsonKey(name: 'wind_speed')
  final int windSpeed;
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  final int pressure;
  final double precip;
  final int humidity;
  final int cloudcover;
  final int feelslike;
  @JsonKey(name: 'uv_index')
  final int uvIndex;
  final int visibility;
  @JsonKey(name: 'is_day')
  final String isDay;

  Current(
      {this.observationTime,
      this.temperature,
      this.weatherIcons,
      this.weatherDescriptions,
      this.windSpeed,
      this.windDegree,
      this.windDir,
      this.pressure,
      this.precip,
      this.humidity,
      this.cloudcover,
      this.feelslike,
      this.uvIndex,
      this.visibility,
      this.isDay});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

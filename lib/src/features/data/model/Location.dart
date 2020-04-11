import 'package:json_annotation/json_annotation.dart';

part 'Location.g.dart';

@JsonSerializable(nullable: false)
class Location {
  final String name;
  final String country;
  final String region;
  final String lat;
  final String lon;
  @JsonKey(name: 'timezone_id')
  final String timezoneId;
  final String localtime;
  @JsonKey(name: 'localtime_epoch')
  final int localtimeEpoch;
  @JsonKey(name: 'utc_offset')
  final String utcOffset;

  Location(
      {this.name,
      this.country,
      this.region,
      this.lat,
      this.lon,
      this.timezoneId,
      this.localtime,
      this.localtimeEpoch,
      this.utcOffset});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

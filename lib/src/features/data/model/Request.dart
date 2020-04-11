import 'package:json_annotation/json_annotation.dart';

part 'Request.g.dart';

@JsonSerializable(nullable: false)
class Request {
  final String type;
  final String query;
  final String language;
  final String unit;

  Request({this.type, this.query, this.language, this.unit});

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

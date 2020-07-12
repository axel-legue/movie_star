import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable(nullable: false)
class Response {
  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'status_message')
  final String statusMessage;

  const Response({this.statusCode, this.statusMessage});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
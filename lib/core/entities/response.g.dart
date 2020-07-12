// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
